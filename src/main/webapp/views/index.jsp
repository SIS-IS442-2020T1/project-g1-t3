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

<script>
    function getEmail() {
        var email = document.getElementById('email').value;
        console.log(email);

        // Step 1
        var request = new XMLHttpRequest();

        // Step 2
        // Register function
        request.onreadystatechange = function() {
            // Step 5
            if( this.readyState == 4 && this.status == 200 ) {
                // Response is ready
                console.log('success');
                var json_obj = JSON.parse(request.responseText);
                console.log(json_obj);
                processLogin(json_obj);
            }
            // else if( request.readyState == 4 && request.status == 404 ) {
            //     console.log('Fail to retrieve request')
            }

        // Step 3
        var url = `http://localhost:9100/findByEmail/${email}`; 

        
        request.open("GET", url, true); 
        request.send();

        // var url = `http://localhost:9100/addAccount/`; 

        // request.open("POST", url, true); 
        // request.setRequestHeader("Content-type", "application/json;charset=UTF-8"); 
        // request.send(JSON.stringify({
        //     "email": "test",
        //     "password": "test"
        // })); // query parameters

    }

    function processLogin(json_obj) {
            var email = json_obj.email;
            var password = json_obj.password;

            var input_password = document.getElementById('password').value;

            if (password == input_password) {
                window.location.replace('./favourite.jsp')
            }

        }
</script>
</body>  
</html>  