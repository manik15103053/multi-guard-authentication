<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password reset</title>
    <style>
        /* Add your custom CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .header {
            background-color: #007bff;
            color: #ffffff;
            text-align: center;
            padding: 10px 0;
        }
        .content {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        
        <div class="header">
            {{-- <h4>{{ $subject }}</h4> --}}
        </div>
        <div class="content">
            <div class="card">
                <div class="row">
                    <div class="col-md-12 d-flex justify-content-center">
                        <div class="card-header">
                            <h4>Password reset, </h4>
                        </div>
                        <div class="card-body" style="width: 100%; height:50%;">
                            <p>{!! $body !!}</p>
                            <p><a href="{{ $action_link }}" class="btn btn-info mb-4">Click Here</a></p>
                            <p style="font-size:12px; text-align: justify;">{!! $action_link !!}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
