<!DOCTYPE html>
<html>
    <head>
        <!-- <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">  -->

        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <link href="main/css/bootstrap.css" rel="stylesheet">
        <link href="main/css/font-awesome.css" rel="stylesheet">
        <link href="main/css/flaticon.css" rel="stylesheet">
        <link href="main/css/slick-slider.css" rel="stylesheet">
        <link href="main/css/prettyphoto.css" rel="stylesheet">
        <link href="main/build/mediaelementplayer.css" rel="stylesheet">
        <link href="main/style.css" rel="stylesheet">
        <link href="main/css/color.css" rel="stylesheet">
        <link href="main/css/color-two.css" rel="stylesheet">
        <link href="main/css/color-three.css" rel="stylesheet">
        <link href="main/css/color-four.css" rel="stylesheet">
        <link href="main/css/responsive.css" rel="stylesheet">

        <title>Web Services Management</title>

    </head>

    <body>
        <div class="wm-main-wrapper">
            <!-- ! ===================================== NAVBAR START ===================================== -->
            <!--// Header \\-->
            <header id="wm-header" class="wm-header-one" >
                <!--// TopStrip \\-->
                <div class="wm-topstrip">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
    
                                <ul class="wm-adminuser-section">
                                    <li>
                                        <a id="welcome" style='font-size: 15px;'>Hi, Admin.</a>
                                    </li>
                                    <li>
    
                                    </li>
                                    <li>
                                        <!-- <a href="#" class="wm-search-btn" data-toggle="modal" data-target="#ModalSearch"><i
                                                class="wmicon-search"></i></a> -->
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// MainHeader \\-->
                <div class="wm-main-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3"><a href="index.html" class="wm-logo" style='margin: 0px 0px 0px 0px'>
                                <img src="login/images/psa-logo-white.png" width="130px" height="50px" alt="logo"></a>
                            </div>
                                <div class=" col-md-9">
                                    <!--// Navigation \\-->
                                    <nav class="navbar navbar-default">
                                        <div class="navbar-header">
                                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                                data-target="#navbar-collapse-1" aria-expanded="true">
                                                <span class="sr-only">Toggle navigation</span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                            </button>
                                        </div>
                                        <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                            <ul class="nav navbar-nav" id="topNav">
                                                <li>
                                                    <a href="#">Web Services Settings</a>
                                                </li>
    
                                                <li>
                                                    <a href="#" onclick="emailAddressSettings()" >Email Address Settings</a>
                                                </li>

                                                <li class="wm-megamenu-li" id="logout">
                                                    <a href="#" onclick="logout()">Logout</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// MainHeader \\-->
            </header>
             <!--// Header \\-->

            <div class="wm-mini-header">
                <span class="wm-blue-transparent"></span>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="wm-mini-title">
                                <h1>Web Services Settings</h1>
                            </div>
                            <!-- <div class="wm-breadcrumb">
                                <ul>
                                    <li><a href="index-2.html">Main</a></li>
                                    
                                </ul>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>  
            <!-- ! ===================================== NAVBAR END ===================================== -->

            <div class='container'>
                <div class="col-md-12">
                    <div class="wm-classic-heading" style='margin-bottom: 50px'>
                        <!-- <h2>Only fill up what needs to be changed</h2> -->
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="wm-form-wrap wm-typography-element">
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="wm-form-listing">
                                    <!-- <label for="apikeyHolder">Api key</label>
                                    <input type="text" class="form-control" id="api"> -->
                                    <li class="wm-label-sec">API Key</li>
                                    <li><input type="text" class="form-control" id="api"></li>


                                    <li class="wm-label-sec">Hours</li>
                                    <li><input type="number" id="currentDayHours"min="0" max="24" placeholder="0" class="form-control"></li>

                                    <li class="wm-label-sec">Minutes (less than 60)</li>
                                    <li><input type="number" id="currentDayMinutes" min="0" max="59" placeholder="0" class="form-control"/></li>
                      
                                    <li class="wm-label-sec">Timing For Retrieval Of Daily Vessel Information</li>
                                    <li></li><input type="time" id="dailyTiming"/></li>

                                </ul>

                                <button type="submit" class="btn btn-success" style='float:right' onclick='getAllVar()'>SUBMIT</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <br>

            <!-- ! ===================================== FOOTER START ===================================== -->

            <footerid="wm-footer" class="wm-footer-one">
                <!--// FooterNewsLatter \\-->
                    <div class="wm-footer-newslatter">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <form>
                                        <input type="submit" value="Copyrighted by Port of Singapore Authority">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="wm-footer-widget" style=' padding-top:0px; padding-bottom:0px;'>
                        <div class="container">
                            <div class="row">
                                <aside class="widget widget_contact_info col-md-3" style='float: right; margin-bottom:0px'>
                                    <a href="https://www.globalpsa.com/" class="wm-footer-logo" style='margin-bottom:0px'><img src="login/images/psa-logo-white.png" alt="" width = "197px" height = "62px" ></a>
                                    <ul>
                                        <li><i class="wm-color wmicon-pin"></i> PSA Horizons,<br>
                                            1 Harbour Drive, <br>Singapore 117352</li>
                                        <li><i class="wm-color wmicon-phone"></i>  Tel +65 62747111</li>
                                        <li><i class="wm-color wmicon-letter"></i> <a
                                                href="https://www.globalpsa.com/contactus/">https://www.globalpsa.com/contactus</a></li>
                                    </ul>
                                
                                </aside>

                                <aside style='float:left; padding-top:65px'>
                                    <a href='https://www.globalpsa.com/careers/'>
                                    <img src="login/images/psa-banner.jpeg" alt="" width = "800px" height = "auto">
                                    </a>
                                </aside>

                                
                            </div>
                        </div>
                    </div>
                    <!--// FooterNewsLatter \\-->
            </footer>
            <!-- ! ===================================== FOOTER END =====================================-->

        </div>
    </body>

<!-- <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <span class="navbar-brand mb-0 h1">PSA Admin Page</span>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#" >Webservice Settings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="emailAddressSettings()" >Email address Settings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="logout()" >Logout</a>
                </li>
                </ul>
            </div>
        </nav>
</div> -->


    <script type="text/javascript" src="script/jquery.js"></script>
	<script type="text/javascript" src="script/modernizr.js"></script>
    <script type="text/javascript" src="script/bootstrap.min.js"></script>
    <script type="text/javascript" src="script/jquery.prettyphoto.js"></script>
    <script type="text/javascript" src="script/jquery.countdown.min.js"></script>
    <script type="text/javascript" src="script/fitvideo.js"></script>
    <script type="text/javascript" src="script/skills.js"></script>
    <script type="text/javascript" src="script/slick.slider.min.js"></script>
    <script type="text/javascript" src="script/waypoints-min.js"></script>
    <script type="text/javascript" src="build/mediaelement-and-player.min.js"></script>
    <script type="text/javascript" src="script/isotope.min.js"></script>
    <script type="text/javascript" src="script/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="script/functions.js"></script>


<script>

    var email= sessionStorage.getItem("email");
    console.log("session "+ email);
    if(email == null){
        logout();
    }
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

    function emailAddressSettings(){
        window.location.replace("./emailSettings");
    }

    function logout(){
        sessionStorage.clear();
        window.location.replace("http://localhost:9100/login");
    }
</script>
</html>