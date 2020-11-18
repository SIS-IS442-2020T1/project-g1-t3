<!DOCTYPE html>  
<html>  
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--===============================================================================================-->	
	    <link rel="icon" type="image/png" href="login/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login/vendor/animate/animate.css">
    <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="login/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login/vendor/select2/select2.min.css">
    <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="login/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="login/css/util.css">
        <link rel="stylesheet" type="text/css" href="login/css/main.css">
    <!--===============================================================================================-->

        <title>Login</title>
    </head>
<body>

    <!-- load background image -->
    <div class="container-login100" style="background-image: url('login/images/port-of-singapore-hd.jpg');">
        <div class="wrap-login100 p-t-30 p-b-50">
            <span class="login100-form-title p-b-41">
                
                <img src="login/images/psa-logo.png" alt="PSA Logo" height="100px" width="200px">
                <br><br>
                <span style = "color: #ffffff;">PORTNET 2.0</span><br><br>

                <span>Login</span>
            </span>
            <div class="wrap-input100 validate-input" data-validate = "Enter username">
                <input class="input100" type="text" id='email' name="username" placeholder="Email Address">
                <span class="focus-input100" data-placeholder="&#xe82a;"></span>

                
            </div>
            <!-- Need to add select button -->
            <br> 

            <div class="wrap-input100 validate-input" data-validate="Enter password">
                <input class="input100" type="password" id='password' name="pass" placeholder="Password">
                <span class="focus-input100" data-placeholder="&#xe80f;"></span>
            </div>


            <div class="container-login100-form-btn m-t-32">
                <button class="login100-form-btn" id="login" onclick='getEmail()' style='background: #008810'>Login</button> 
            </div>
            <br>

            <div class="container-login100-form-btn m-t-32">
                <button class="login100-form-btn" id="register" onclick='register()'>Create Account</button> 
                <br><br>
                <button class="login100-form-btn" id="forgetPassword"  onclick="forgetPassword()">
                    Forget Password
                </button>
            </div>

            <div id='alertMessage'>
                <!-- <div class="alert alert-danger">
                    <strong>Error!</strong> Passwords entered do not match.
                </div> -->
            </div>


        </div>
    </div>



<!-- <div class="container">
    <h1>Login</h1>  
<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="email" aria-describedby="emailHelp">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password">
  </div>
  <div class="form-group form-check">
  </div>
  <button type="submit" class="btn btn-primary" onclick='getEmail()'>Submit</button>
</div>
<div>
    <button id="register" class="btn btn-primary" onclick='register()'>Register</button>
    <button id="forgetPassword" class="btn btn-primary" onclick='forgetPassword()'>Forget Password?</button>
</div> -->

<div id='alertMessage'>
    <!-- <div class="alert alert-danger">
        <strong>Error!</strong> Passwords entered do not match.
    </div> -->
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jsSHA/2.0.2/sha.js"></script>
<script>

    function forgetPassword(){
        window.location = './forgetPassword';
        Redirect();
    }

    function register(){
        window.location = './register';
        Redirect();
    }
    
    function getEmail() {
        if(document.getElementById('email').value == "" || document.getElementById('password').value == ""){
            // alert("Please fill up all the field!");
            var alert = `<div class="alert alert-danger">
                                <strong>Error!</strong> Please fill in all fields before submitting.
                            </div>`;
            document.getElementById('alertMessage').innerHTML = alert;
        } else {
            var email = document.getElementById('email').value;
            // console.log(email);

            // Step 1
            var request = new XMLHttpRequest();

            var url = `http://localhost:9100/findByEmail/`+email;
            console.log(url);

            request.open("GET", url, true);
            request.send();


            // Step 2
            // Register function
            request.onreadystatechange = function() {
                // Step 5
                if( this.readyState == 4 && this.status == 200 ) {
                    // Response is ready
                    // console.log('success');
                    // try{
                    var json_obj = JSON.parse(request.responseText);
                    console.log('response from findByEmail:' + json_obj);
                    if (json_obj == null) {
                        var alert = `<div class="alert alert-danger">
                                     <strong>Error!</strong> Invalid email!
                                    </div>`;
                    document.getElementById('alertMessage').innerHTML = alert;
                    } else {
                        processLogin(json_obj);
                    }
                    // }
                    // catch (err) {
                    //     console.log('error from findByEmail:' + err);
                    //     // alert("Invalid email");
                    //     var alert = `<div class="alert alert-danger">
                    //                 <strong>Error!</strong> Invalid email!
                    //             </div>`;
                    //     document.getElementById('alertMessage').innerHTML = alert;
                    // }

                }
                else if( request.readyState == 4 && request.status == 404 ) {
                    console.log('Fail to retrieve request');
                }
            }
        }
    }

    function processLogin(json_obj) {
            var email = json_obj.email;
            var actualPassword = json_obj.password;

            var input_password = document.getElementById('password').value;

            //console.log(input_password);

            var hashObj = new jsSHA("SHA-512", "TEXT", {numRounds: 1});
            hashObj.update(input_password);
            var hash = hashObj.getHash("HEX");
            input_password = hash;

            //console.log(input_password);

            if (actualPassword == input_password) {
                // session.setAttribute("email", email);
                if(email == "admin@admin.com"){
                    sessionStorage.setItem("email", email);
                    // window.location.replace('./webservice')
                    window.location = './webservice';
                    Redirect();
                }else{
                    sessionStorage.setItem("email", email);
                    // window.location.replace('./vesselschedules')
                    window.location = './vesselschedules';
                    Redirect();
                }
            }else{
                // alert("Wrong password");
                var alert = `<div class="alert alert-danger">
                                <strong>Error!</strong> Wrong password.
                            </div>`;
                document.getElementById('alertMessage').innerHTML = alert;
            }

        }
</script>
</body>  
</html>  