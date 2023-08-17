<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Profile Update</title>
</head>
<body>
    <div class="container ">
        <div class="row">
            <div class="col-md-4 offset-md-4" style="margin-top:45px">
                <h4>Profile Update</h4><hr>
                <form action="{{ route('admin.profile.update') }}" method="POST" autocomplete="off">
                    @if (Session::get('success'))
                        <div class="alert alert-success">
                            {{ Session::get('success') }}
                        </div>
                    @endif
                    
                    @csrf
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" name="name" placeholder="Enter name.." value="{{ Auth::guard('admin')->user()->name? : old('name') }}">
                        <span class="text-danger">@error('name'){{ $message }}@enderror</span>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" placeholder="Enter email address.." value="{{ Auth::guard('admin')->user()->email ? : old('email') }}">
                        <span class="text-danger">@error('email'){{ $message }}@enderror</span>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" name="phone" placeholder="Enter phone.." value="{{ Auth::guard('admin')->user()->phone ? : old('phone') }}">
                        <span class="text-danger">@error('phone'){{ $message }}@enderror</span>
                    </div>
                    <div class="form-group">
                        <label for="phone">Profile Image</label>
                        <input type="file" class="form-control" name="profile_image" placeholder="Enter phone.." value="{{ old('profile_image') }}">
                        <span class="text-danger">@error('profile_image'){{ $message }}@enderror</span>
                    </div>
                    
                   
                    <div class="form-group">
                        <button type="submit" class="btn btn-info">Update</button>
                    </div>
                    <br>
                </form>
            </div>
            <div class="col-md-4 offset-md-4" style="margin-top:45px">
                <h4>Change Password</h4><hr>
                <form action="{{ route('admin.update-password') }}" method="POST" autocomplete="off">
                    @if (Session::get('success'))
                        <div class="alert alert-success">
                            {{ Session::get('success') }}
                        </div>
                    @endif
                    @if (Session::get('fail'))
                        <div class="alert alert-danger">
                            {{ Session::get('fail') }}
                        </div>
                    @endif
                    @csrf
                    <div class="form-group">
                        <label for="current_password">Current Password</label>
                        <input type="password" class="form-control" name="current_password" placeholder="Enter Current Password..">
                        <span class="text-danger">@error('current_password'){{ $message }}@enderror</span>
                    </div>
                    <div class="form-group">
                        <label for="new_password">New Password</label>
                        <input type="password" class="form-control" name="new_password" placeholder="Enter New Password..">
                        <span class="text-danger">@error('new_password'){{ $message }}@enderror</span>
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">Confirm Password</label>
                        <input type="password" class="form-control" name="confirm_password" placeholder="Enter Confirm Password..">
                        <span class="text-danger">@error('confirm_password'){{ $message }}@enderror</span>
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn btn-info">Update</button>
                    </div>
                    <br>
                </form>
            </div>
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>