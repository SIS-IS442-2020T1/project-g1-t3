<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>

<body onload="retrieve()">

    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <span class="navbar-brand mb-0 h1">PSA Admin Page</span>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#" onclick="webservice()">Webservice Settings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Email address Settings</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="logout()">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>

    <div class="container">
        <h1>Email Address Settings</h1>
        <div class="form-group">
            <label for="emailHolder">Email Suffix</label>
            <input type="text" class="form-control" id="email">
            <button type="submit" class="btn btn-primary" onclick='add()'>Add</button>
            <button type="submit" class="btn btn-primary" onclick='removeName()'>Delete</button>
        </div>

        <table border='1' id="emailbody">
            <tr>
                <th>
                    <h5>Email Suffix</h5>
                </th>
            </tr>

        </table>





        <script>

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
                        var table = document.getElementById('emailbody');
                        for (var i = 0; i < json_obj.length; i++) {
                            var eachRow = '<tr><td>' + json_obj[i].emailSuffix + '</td></tr>';
                            table.innerHTML += eachRow;
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

            function add() {
                var email = document.getElementById('email').value;
                console.log(email);
                if (email != "") {
                    if (email.substring(0, 1) == "@") {
                        // Step 1
                        var request = new XMLHttpRequest();

                        // Step 2
                        var url = `http://localhost:9100/addEmailSuffix/`;

                        request.open("POST", url, true);
                        request.setRequestHeader("Content-type", "application/json;charset=UTF-8");
                        request.send(JSON.stringify({
                            "emailSuffix": email
                        })); // query parameters

                        // Step 2
                        // Register function
                        request.onreadystatechange = function () {
                            // Step 5
                            if (this.readyState == 4 && this.status == 200) {
                                // Response is ready
                                console.log('success');
                                alert("success");
                                window.location.reload(true);
                                //var json_obj = JSON.parse(request.responseText);
                                //console.log(json_obj);
                            }
                            else {
                                console.log(this.status);
                            }
                        }
                    } else {
                        alert("Email have to start with @");
                    }
                } else {
                    alert("There is no input.");
                }
            }

            function webservice() {
                window.location.replace("./webservice");
            }

            function logout() {
                window.location.replace("./login");
            }

            function removeName() {
                var email = document.getElementById('email').value;
                console.log(email);
                    if (email != "") {
                        if (email.substring(0, 1) == "@") {
                            // Step 1
                            var request = new XMLHttpRequest();

                            // Step 2
                            var url = `/deleteEmailSuffix/` + email;

                            request.open("DELETE", url, true);
                            request.send();

                            // Step 2
                            // Register function
                            request.onreadystatechange = function () {
                                // Step 5
                                if (this.status == 200) {
                                    // Response is ready
                                    alert("success");
                                    window.location.reload(true);
                                    //var json_obj = JSON.parse(request.responseText);
                                    //console.log(json_obj);
                                }else{
                                    console.log("error");
                                }
                            }
                        } else {
                            alert("Email have to start with @");
                        }
                    } else {
                        alert("There is no input.");
                    }
                }


        </script>
</body>

</html>