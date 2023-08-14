<?php

namespace App\Http\Controllers\Doctor;

use App\Models\Doctor;
use Illuminate\Support\Str;
use App\Models\VerifyDoctor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class DoctorController extends Controller
{
    public function create(Request $request){
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:doctors,email',
            'hospital' => 'required',
            'password' => 'required|min:6|max:30',
            'cpassword' => 'required|min:6|max:30|same:password',
        ],
    [
        'cpassword.required' => 'The Confirm Password is required',
        'cpassword.same' => 'The Password and Confirmd password must not be same'
    ]);

    $doctor = new Doctor();
    $doctor->name = $request->name;
    $doctor->email = $request->email;
    $doctor->hospital = $request->hospital;
    $doctor->password = Hash::make($request->password);
    $save = $doctor->save();

    $last_id = $doctor->id;

    $token = $last_id.hash('sha256', Str::random(120));
    $verifyUrl = route('doctor.verify', ['token' => $token, 'service' => 'Email_verification']);

    VerifyDoctor::create([
        'doctor_id' => $last_id,
        'token' => $token,
    ]);

    $message = 'Dear <b>'.$request->name.'<b>';
    $message .= 'Thanks for singing up, we just need you to verify your email address to complete setting up your account.';
    $mail_data = [
        'recipient' => $request->email,
        'fromEmail' => $request->email,
        'fromName' => $request->name,
        'subject' => 'Email Verification',
        'body'  => $message,
        'actionLink' => $verifyUrl,
    ];

    Mail::send('email-template', $mail_data, function($message) use ($mail_data){
            $message->to($mail_data['recipient'])
                    ->from($mail_data['fromEmail'], $mail_data['fromName'])
                    ->subject($mail_data['subject']);   
    });
    if($save){
        return redirect()->back()->with('success', 'You need to verify your account, We have send you an activation link, please check your email.');
    }else{
        return redirect()->back()->with('fail', 'Something went to wrong, failed to register');
    }
    }

    public function verify(Request $request){

        $token = $request->token;
        $verifyDoctor = VerifyDoctor::where('token', $token)->first();

        if(!is_null($verifyDoctor)){
            $doctor = $verifyDoctor->doctor;

            if(!$doctor->email_verified){
                $verifyDoctor->doctor->email_verified = 1;
                $verifyDoctor->doctor->save();

                return redirect()->route('doctor.login')->with('info', 'Your email is verified successfully, You can now login')->with('verifiedEmail', $doctor->email);
            }else{
                return redirect()->route('doctor.login')->with('info', 'Your email is already verified, You can now login')->with('verifiedEmail', $doctor->email);
            }
        }
    }
    public function check(Request $request){
        $request->validate([
            'email' => 'required|email|exists:doctors,email',
            'password' => 'required|min:5|max:30',
        ],[
            'email.exists' => 'This email is not exists on Doctor table',
        ]);

        $check = $request->only('email', 'password');
        if(Auth::guard('doctor')->attempt($check)){
            return redirect()->route('doctor.home');
        }else{
            return redirect()->route('doctor.login')->with('fail', 'Incorrect Credentials');
        }
    }

    public function logout(){
        Auth::guard('doctor')->logout();
        return redirect('/');
    }

    public function showForgotForm(){
        return view('dashboard.doctor.forget-password');
    }

    public function sendResetlink(Request $request){

        $request->validate([
            'email' => 'required|email|exists:doctors,email'
        ]);

        $token = Str::random(64);
        DB::table('password_resets')->insert([
            'email' => $request->email,
            'token' => $token,
            'created_at' => Carbon::now(),
        ]);

        $action_link = route('doctor.show-reset-form', ['token' => $token, 'email' =>$request->email]);

        $body = 'We are received a request to reset the password for <b>Your app name</b> account associated with ' .$request->email.'You can reset your password by clicking the link below';

        Mail::send('email-forgot', ['action_link' =>$action_link, 'body' => $body], function($message) use ($request){
                $message->from('noreply@gmail.com', 'Your App Name')
                        ->to($request->email, 'Your Name')
                        ->subject('Reset Password');
        });

        return redirect()->back()->with('success', 'We have e-mailed your password reset link');
    }

    public function showResetForm(Request $request, $token = null){

        return view('dashboard.doctor.reset-password-form')->with(['token' => $token, 'email' => $request->email]);
    }

    public function resetPassword(Request $request){
        $request->validate([
            'email' => 'required|email|exists:doctors,email',
            'password' => 'required|min:6|confirmed',
            'password_confirmation' => 'required'
        ]);

        $check_token = DB::table('password_resets')->where([
            'email' => $request->email,
            'token' => $request->token,
        ])->first();

        if(!$check_token){
            return back()->withInput()->with('fail', 'Invalid Token');
        }else{
            Doctor::where('email', $request->email)->update([
                'password' => Hash::make($request->password),
            ]);

            DB::table('password_resets')->where([
                'email' => $request->email,
            ])->delete();

            return redirect()->route('doctor.login')->with('info', 'Your Password has been changed! You can login with new password')
                    ->with('verifiedEmail', $request->email);
        }
    }
   
}
