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
<h5>Only fill up what needs to be changed</h5>
    <label for="apikeyHolder">Api key</label>
    <input type="text" class="form-control" id="api">
  </div>
  <h5>Interval for the Current Day</h5>
  <div class="row">
  <div class="form-group">
    <label for="currentdayIntervalHolder">Hours</label>
    <input type="number" id="currentDayHours"min="0" max="24" placeholder="0"/>
    <label for="currentdayIntervalHolder">Minutes (less than 60)</label>
    <input type="number" id="currentDayMinutes" min="0" max="59" placeholder="0"/>
  </div>
  </div>
  <h5>Timing for retrieve of Vessel information daily</h5>
  <div class="row">
    <div class="form-group">
      <label for="dailyIntervalHolder">Timing</label>
      <input type="time" id="dailyTiming"/>
    </div>
  </div>
  <div class="form-group form-check">
  </div>
  <button type="submit" class="btn btn-primary" onclick='getAllVar()'>Submit</button>
</div>

<script>
    function getAllVar() {
        var api = document.getElementById('api').value;
        var currentDayHours = document.getElementById('currentDayHours').value;
        var currentDayMinutes = document.getElementById('currentDayMinutes').value;
        var daily = document.getElementById('dailyTiming').value;
        console.log(api, currentDayHours, currentDayMinutes, daily);
        var currentday = "";
        if(daily != "" || currentDayHours != "" || currentDayMinutes != "" || api != ""){
        if(currentDayMinutes < 60){
            if(currentDayHours != "" || currentDayMinutes != ""){
                if(currentDayHours == ""){
                    currentDayHours = "0";
                }
                if(currentDayMinutes == ""){
                    currentDayMinutes = "0";
                }
                currentday = (parseInt(currentDayHours) * 60 * 60 + parseInt(currentDayMinutes) * 60) * 1000;
            }
            if(daily != ""){
                var hours = daily.substring(0, 2);
                if (hours.substring(0, 1) == "0"){hours = hours.substring(1);}
                var minutes = daily.substring(3);
                if (minutes.substring(0, 1) == "0"){minutes = minutes.substring(1);}
                console.log(hours, minutes);
                daily = "0 " + minutes + " " + hours + " * * *";
                console.log(daily);
            }
            console.log(api, currentDayHours, currentDayMinutes, currentday, daily);

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
                    alert(request.responseText);
                    //var json_obj = JSON.parse(request.responseText);
                    //console.log(json_obj);
                }
                else{
                     console.log(this.status);
                }
            }
        }else{
            alert("Minutes should not be more than 59 minutes.");
        }
        }else{
            alert("There is no input.");
        }
    }
</script>
</body>
</html>