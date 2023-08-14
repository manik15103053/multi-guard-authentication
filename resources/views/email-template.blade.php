<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Email Subject Here</title>
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
            <h4>{{ $subject }}</h4>
        </div>
        <div class="content">
            <h4>Welcome, </h4>
            <p>{!! $body !!}</p>
            <p><a href="{{ $actionLink }}" class="btn btn-info">Click Here</a></p>
            <p>Thank Your</p>
        </div>
    </div>
</body>
</html>
