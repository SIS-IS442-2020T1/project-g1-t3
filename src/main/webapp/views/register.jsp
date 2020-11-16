<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body onload="retrieve()">

<div class="container">
    <h1>Register</h1>
<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" required>
    <select id = "emailaddress" name = "email address">
    </select>
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password" required>
  </div>
    <div class="form-group">
      <label for="password">Retype Password</label>
      <input type="password" class="form-control" id="confirmPassword" required>
    </div>
    <div class="form-group">
      <label for="dateOfBirth">Date of Birth</label>
      <input type="date" class="form-control" id="dateOfBirth" required>
    </div>
  <div class="form-group form-check">
  </div>
  <button type="submit" class="btn btn-primary" onclick='register()'>Submit</button>
</div>
<div>
    <button id="back" onclick='back()'>back</button>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jsSHA/2.0.2/sha.js"></script>
<script>

    function back() {
        window.location.replace('./login');
    }

    function register() {
        if(document.getElementById('email').value == "" || document.getElementById('password').value == "" || document.getElementById('confirmPassword').value == "" || document.getElementById('dateOfBirth').value == ""){
            alert("Please fill up all the field!");
        }else{
        var email = document.getElementById('email').value + document.getElementById('emailaddress').value;
        var dob = document.getElementById('dateOfBirth').value;
        if(document.getElementById('password').value == document.getElementById('confirmPassword').value){
            var password = document.getElementById('password').value;
            var hashObj = new jsSHA("SHA-512", "TEXT", {numRounds: 1});
            hashObj.update(password);
            var hash = hashObj.getHash("HEX");
            password = hash;
        }
        else{
            alert("Password does not match!");
        }
        console.log(email, password);

        var request = new XMLHttpRequest();

        var url = `http://localhost:9100/addAccount/`;

        request.open("POST", url, true);

        request.setRequestHeader("Content-type", "application/json;charset=UTF-8");
            request.send(JSON.stringify({
                 "email": email,
                 "password": password,
                 "dateOfBirth": dob
        })); // query parameters

        // Step 2
        // Register function
        request.onreadystatechange = function() {
            // Step 5
            if( this.readyState == 4 && this.status == 200 ) {
                // Response is ready
                console.log('success');
                alert(request.responseText);
                if(request.responseText == "Account created"){
                    window.location.replace('./login');
                }
            }
            else if( request.readyState == 4 && request.status == 404 ) {
                 console.log('Fail to retrieve request');
            }
           }

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