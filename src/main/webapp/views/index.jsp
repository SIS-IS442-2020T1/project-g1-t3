<!DOCTYPE html>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>Login</title>  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>  
<body>

<div class="container">
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
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jsSHA/2.0.2/sha.js"></script>
<script>

    function forgetPassword(){
        window.location.replace('./forgetPassword');
    }

    function register(){
        window.location.replace('./register');
    }
    function getEmail() {
        if(document.getElementById('email').value == "" || document.getElementById('password').value == ""){
            alert("Please fill up all the field!");
        } else {
        var email = document.getElementById('email').value;
        console.log(email);

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
                console.log('success');
                try{
                    var json_obj = JSON.parse(request.responseText);
                    console.log(json_obj);
                    processLogin(json_obj);
                }
                catch (err) {
                    alert("Invalid email");
                }

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

            console.log(input_password);

            var hashObj = new jsSHA("SHA-512", "TEXT", {numRounds: 1});
            hashObj.update(input_password);
            var hash = hashObj.getHash("HEX");
            input_password = hash;

            console.log(input_password);

            if (actualPassword == input_password) {
                // session.setAttribute("email", email);
                sessionStorage.setItem("email", email);
                window.location.replace('./vesselschedules')
            }else{
                alert("Wrong password");
            }

        }
</script>
</body>  
</html>  