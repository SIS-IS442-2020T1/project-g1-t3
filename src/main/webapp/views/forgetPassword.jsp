<!DOCTYPE html>
<html>
<head>
    <!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->

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

    <title>Forget Password</title>
</head>
<body onload="retrieve()">
    <div class="container-login100" style="background-image: url('login/images/port-of-singapore-hd.jpg');">
        <div class="wrap-login100 p-t-30 p-b-50">
            <span class="login100-form-title p-b-41">
                
                <img src="login/images/psa-logo.png" alt="PSA Logo" height="100px" width="200px">
                <br><br>
                <span style = "color: #ffffff">PORTNET 2.0 </span><br><br>

                <span>Forget Password</span>
            </span>

            <div class="wrap-input100 validate-input" data-validate = "Enter username">
                <input class="input100" type="email" id='email' name="username" placeholder="Email Address">
                <span class="focus-input100" data-placeholder="&#xe82a;"></span>

                <select id = 'emailaddress' name = "email address" style='margin-left: 90%'>
                </select>

            </div>

            <div class="wrap-input100 validate-input" data-validate="Enter password">
                <input class="input100" type="date" id='dateOfBirth' >
                <span class="focus-input100" data-placeholder="&#xe80f;"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Enter password">
                <input class="input100" type="password" id='password' name="pass" placeholder="New Password">
                <span class="focus-input100" data-placeholder="&#xe80f;"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Enter password">
                <input class="input100" type="password" id='confirmPassword' name="pass" placeholder="Confirm Password">
                <span class="focus-input100" data-placeholder="&#xe80f;"></span>
            </div>

            <div class="container-login100-form-btn m-t-32">
                <button class="login100-form-btn" id="back" onclick='back()'>Back to Login Page</button> 
                
                <button class="login100-form-btn" style='background: #008810' onclick="register()">
                    Reset
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
    <h1>Forget Password</h1>
<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" required>
    <select id = "emailaddress" name = "email address">
    </select>
  </div>
  <div class="form-group">
    <label for="dateOfBirth">Date of Birth</label>
    <input type="date" class="form-control" id="dateOfBirth" required>
  </div>
  <div class="form-group">
    <label for="password">New Password</label>
    <input type="password" class="form-control" id="password" required>
  </div>
    <div class="form-group">
      <label for="password">Retype New Password</label>
      <input type="password" class="form-control" id="confirmPassword" required>
    </div>
  <div class="form-group form-check">
  </div>
  <button type="submit" class="btn btn-primary" onclick='forget()'>Submit</button>
</div>
<div>
    <button id="back" class="btn btn-primary" onclick='back()'>back</button>
</div> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jsSHA/2.0.2/sha.js"></script>
<script>

    function back() {
        window.location = './login';
        Redirect();
    }

    function forget() {
        if(document.getElementById('email').value == "" || document.getElementById('password').value == "" || document.getElementById('confirmPassword').value == "" || document.getElementById('dateOfBirth').value == ""){
            // alert("Please fill up all the field!");
            var alert = `<div class="alert alert-danger">
                                <strong>Error!</strong> Please fill in all fields before submitting.
                            </div>`;
            document.getElementById('alertMessage').innerHTML = alert;
        }else{
        var email = document.getElementById('email').value + document.getElementById('emailaddress').value;
        if(document.getElementById('password').value != document.getElementById('confirmPassword').value){
            // alert("Password does not match!");
            var alert = `<div class="alert alert-danger">
                                <strong>Error!</strong> Passwords enetered do not match.
                            </div>`;
            document.getElementById('alertMessage').innerHTML = alert;
        }
        console.log(email, password);

        // Step 1
        var requestGet = new XMLHttpRequest();

        var url = `http://localhost:9100/findByEmail/`+email;

        requestGet.open("GET", url, true);
        requestGet.send();

        requestGet.onreadystatechange = function() {
        // Step 5
        if( this.readyState == 4 && this.status == 200 ) {
            // Response is ready
            console.log('success');
            try{
                var json_obj = JSON.parse(requestGet.responseText);
                console.log(json_obj);
                processReset(json_obj);
            }
            catch (err) {
                // alert("Invalid email");
                var alert = `<div class="alert alert-danger">
                                <strong>Error!</strong> Invalid email.
                            </div>`;
                document.getElementById('alertMessage').innerHTML = alert;
            }
        }
        else if( requestGet.readyState == 4 && requestGet.status == 404 ) {
             console.log('Fail to retrieve request');
        }
       }
    }
    }

    function processReset(json_obj) {
        var email = json_obj.email;
        if (json_obj.dateOfBirth == document.getElementById('dateOfBirth').value){

            var password = document.getElementById('password').value;
            var hashObj = new jsSHA("SHA-512", "TEXT", {numRounds: 1});
            hashObj.update(password);
            var hash = hashObj.getHash("HEX");
            password = hash;

            var request = new XMLHttpRequest();

            var url = `http://localhost:9100/updateAccountPassword/`;

            request.open("POST", url, true);

            request.setRequestHeader("Content-type", "application/json;charset=UTF-8");
                        request.send(JSON.stringify({
                             "email": email,
                             "password": password,
                             "dateOfBirth": json_obj.dateOfBirth
            })); // query parameters

            // Step 2
            // Register function
            request.onreadystatechange = function() {
                // Step 5
                if( this.readyState == 4 && this.status == 200 ) {
                    // Response is ready
                    console.log('success');
                    // alert(request.responseText);
                    var alert = `<div class="alert alert-success">
                                <strong>Success!</strong> ${request.responseText}.
                            </div>`;
                    document.getElementById('alertMessage').innerHTML = alert;
                    if(request.responseText == "Password have been replaced"){
                        window.location = './login';
                        Redirect();
                    }
                }
                else if( request.readyState == 4 && request.status == 404 ) {
                     console.log('Fail to retrieve request');
                }
               }

        } else{
        // alert("Wrong date of birth!");
        var alert = `<div class="alert alert-danger">
                                <strong>Error!</strong> Wrong date of birth!.
                            </div>`;
        document.getElementById('alertMessage').innerHTML = alert;
        }

    }

    function retrieve() {
        var request = new XMLHttpRequest();
        var url = `http://localhost:9100/allEmailSuffix/`;


        request.open("GET", url, true);
        request.send();

        request.onreadystatechange = function () {
            // Step 5
            if (this.readyState == 4 && this.status == 200) {
                // Response is ready
                console.log('success');
                console.log(request.responseText);
                //try {
                    var json_obj = JSON.parse(request.responseText);
                    console.log(json_obj);
                    var opt = document.getElementById('emailaddress');
                    for (var i = 0; i < json_obj.length; i++) {
                        var eachRow = '<option value = "'+json_obj[i].emailSuffix+'">'+json_obj[i].emailSuffix+'</option>';
                        opt.innerHTML += eachRow;
                    }

                //}
                //catch (err) {
                //    alert("Cannot parse json");
                //}

            }
            else if (request.readyState == 4 && request.status == 404) {
                console.log('Fail to retrieve request');
            }
        }

    }


</script>
</body>
</html>