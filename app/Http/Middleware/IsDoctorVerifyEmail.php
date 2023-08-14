<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IsDoctorVerifyEmail
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (Auth::guard('doctor')->check()) {
            $doctorUser = Auth::guard('doctor')->user();

            if (!$doctorUser->email_verified) {
                Auth::guard('doctor')->logout();

                return redirect()
                    ->route('doctor.login')
                    ->with('fail', 'You need to confirm your account. We have sent you an activation link. Please check your email')
                    ->withInput();
            }
        } else {
            // User not authenticated, redirect to login
            return redirect()
                ->route('doctor.login')
                ->with('fail', 'You need to log in first')
                ->withInput();
        }
        
        return $next($request);
    }
}
