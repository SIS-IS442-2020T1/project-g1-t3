<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <h1>Webservices Settings</h1>
<div class="form-group">
    <label for="Enter ApikeyHolder">Api key</label>
    <input type="text" class="form-control" id="api">
  </div>
  <div class="form-group">
    <label for="currentdayIntervalHolder">Interval for the Current Day (in hours)</label>
    <input type="text" class="form-control" id="currentday">
  </div>
    <div class="form-group">
      <label for="dailyIntervalHolder">Interval for the Current Day (in hours)</label>
      <input type="text" class="form-control" id="daily">
    </div>
  <div class="form-group form-check">
  </div>
  <button type="submit" class="btn btn-primary" onclick='getAllVar()'>Submit</button>
</div>

<script>
    function getAllVar() {
        var api = document.getElementById('api').value;
        var currentday = document.getElementById('currentday').value;
        var daily = document.getElementById('daily').value;
        console.log(api, currentday, daily);

        // Step 1
        var request = new XMLHttpRequest();

        // Step 2
        var url = `http://localhost:9100/updateWebservice/`;

        request.open("POST", url, true);
        request.setRequestHeader("Content-type", "application/json;charset=UTF-8");
        request.send(JSON.stringify({
            "id": 1,
            "apiKey": api,
            "dailyUpdate": daily,
            "currentDayUpdate": currentday
        })); // query parameters

        // Step 2
        // Register function
        request.onreadystatechange = function() {
            // Step 5
            if( this.readyState == 4 && this.status == 200 ) {
                // Response is ready
                console.log('success');
                var json_obj = JSON.parse(request.responseText);
                console.log(json_obj);
            }
            else{
                 console.log(this.status);
            }
        }

        // Step 3








    }
</script>
</body>
</html>