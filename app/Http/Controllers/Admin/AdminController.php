<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function check(Request $request){
        $request->validate([
            'email' => 'required|email|exists:admins,email',
            'password' => 'required|min:5|max:30',
        ],[
            'email.exists' => 'This email is not exists on admin table',
        ]);

        $check = $request->only('email', 'password');
        if(Auth::guard('admin')->attempt($check)){
            return redirect()->route('admin.home');
        }else{
            return redirect()->route('admin.login')->with('fail','Incorrect Credentials');
        }
    }

    public function logout(){
        Auth::guard('admin')->logout();
        return redirect('/');
    }


    public function profile(){
        return view('dashboard.admin.profile');
    }

    public function updatePro(Request $request){

        $request->validate([
            'email' => 'required',
            'name' => 'required',
            'phone' => 'required'
        ]);

        $auth_id = Auth::guard('admin')->user()->id;

        
        $admin = Admin::where('id', $auth_id)->first();
        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->phone = $request->phone;
        $admin->save();
        return redirect()->route('admin.home')->with('success', 'Your Profile updated Successfully.');
     }

     public function updatePass(Request $request){
        $request->validate([
            'current_password' => 'required',
            'new_password' => 'required|min:6|max:30',
            'confirm_password' => 'required|same:new_password',
        ]);

        if(Hash::check($request->current_password, Auth::guard('admin')->user()->password)){
            if($request->new_password == $request->confirm_password){
                $admin = Admin::where('id', Auth::guard('admin')->user()->id)->first();
                $admin->password = Hash::make($request->new_password);
                $admin->save();
                return redirect()->route('admin.home')->with('success', 'Your Password Updated Successfully.');
            }else{
                return redirect()->back()->with('fail', 'Password Do not match');
            }
        }else{
            return redirect()->back()->with('fail', 'Current Password Do not match');
        }
     }
}
