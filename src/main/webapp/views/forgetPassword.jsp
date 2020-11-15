<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<div class="container">
    <h1>Forget Password</h1>
<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" required>
    <select id = "emailaddress" name = "email address">
        <option value = "@smu.sg">@smu.sg</option>
        <option value = "@psa.com">@psa.com</option>
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
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jsSHA/2.0.2/sha.js"></script>
<script>

    function back() {
        window.location.replace('./login');
    }

    function forget() {
        if(document.getElementById('email').value == "" || document.getElementById('password').value == "" || document.getElementById('confirmPassword').value == "" || document.getElementById('dateOfBirth').value == ""){
                alert("Please fill up all the field!");
        }else{
        var email = document.getElementById('email').value + document.getElementById('emailaddress').value;
        if(document.getElementById('password').value != document.getElementById('confirmPassword').value){
            alert("Password does not match!");
        }
        console.log(email, password);

        // Step 1
        var requestGet = new XMLHttpRequest();

        var url = `http://localhost:9100/findByEmail/${email}`;

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
                alert("Invalid email");
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
                    alert(request.responseText);
                    if(request.responseText == "Password have been replaced"){
                        window.location.replace('./login');
                    }
                }
                else if( request.readyState == 4 && request.status == 404 ) {
                     console.log('Fail to retrieve request');
                }
               }

        } else{
        alert("Wrong date of birth!");
        }

    }
</script>
</body>
</html>