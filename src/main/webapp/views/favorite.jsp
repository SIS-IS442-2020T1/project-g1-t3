<!DOCTYPE html>
<html lang="en">
    <!-- <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">  -->
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

        <title>Vessel Schedules</title>

    </head>
    <body>
        <div class="wm-main-wrapper">

            <!-- ! ===================================== NAVBAR START ===================================== -->
            <!--// Header \\-->
            <header id="wm-header" class="wm-header-one">
                <!--// TopStrip \\-->
                <div class="wm-topstrip">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
    
                                <ul class="wm-adminuser-section">
                                    <li>
                                        <a id="welcome" style='font-size: 15px;'>Hi, User.</a>
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
                                                    <a href="#" onclick='goMainPage()'>Main</a>
                                                </li>
    
                                                <li>
                                                    <a href="#">Favourites</a>
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
                                <h1>My Favourites</h1>
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

            <!-- ? ===================================== TABLE START ===================================== -->
            <div class='container'>
                <div class="panel" >
                    <table id="mytable" class='table'>
                        <thead>
                            <tr>
                                <th>Vessel's Name</th>
                                <th>Incoming Voyage Number</th>
                                <th>Outgoing Voyage Number</th>
                                <th>Berthing Time</th>
                                <th>Departure Time</th>
                                <th>Berth Number</th>
                                <th>Status</th>
                                <th>Change Count</th>
                                <th>Degree of Change</th>
                                <th>Remove from My Favorties</th>
                            </tr>
                        </thead>
                        <tbody id= "thebody">
                        </tbody>
                    </table>
        
                    <br/>
            
                </div>
            </div> 
            <!-- ? ===================================== TABLE END ===================================== -->
        



            <!-- ! ===================================== FOOTER END =====================================-->
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
                                <aside class="widget widget_contact_info col-md-3" style='float: right; margin-botton:0px'>
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
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
        <script type="text/javascript" src="script/functions.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
            var email= sessionStorage.getItem("email");
            console.log("session "+email);
            if(email == null){
                logout();
            }

            findFavoritesByUser(email);
            
            function goMainPage(){
                window.location.replace("http://localhost:9100/vesselschedules2");
            }

            function logout(){
                sessionStorage.clear();
                window.location.replace("http://localhost:9100/login");
            }

            function findFavoritesByUser(email){
                var request = new XMLHttpRequest();
                var url = `http://localhost:9100/FavoriteByUser/`+ email;
                console.log(url);//
                request.open("GET", url, true);
                request.send();
                request.onreadystatechange = function() {
                    if( this.readyState == 4 && this.status == 200 ) {
                        // Response is ready
                        console.log('success');
                        try{
                            var json_obj = JSON.parse(request.responseText);
                            console.log(json_obj);
                                for (const f of json_obj){
                                console.log(f.abbrVslM);
                                findVesselByIds(f.abbrVslM, f.inVoyN);
                                }
                        }catch (err) {
                            alert("Invalid email");
                        }
                    }else if( request.readyState == 4 && request.status == 404 ) {
                        console.log('Fail to retrieve request');
                    }
                }                        
            }

            function findVesselByIds(abbrVslM, inVoyN){
                var request = new XMLHttpRequest();
                var url = `http://localhost:9100/findVesselById/`+abbrVslM +`/`+inVoyN;
                console.log(url);//
                request.open("GET", url, true);
                request.send();
                request.onreadystatechange = function() {
                    if( this.readyState == 4 && this.status == 200 ) {
                        // Response is ready
                        console.log('success');
                        try{
                            var vessel = JSON.parse(request.responseText);
                            // console.log(vessel);
                            var rowId = vessel.abbrVslM + vessel.inVoyN;
                            rowId= rowId .replace(/ /g,'');
                            // console.log(rowId);
                            var degreesChangeDict = {
                        
                                    "white": "No Change",
                                    "yellow": "Medium",
                                    "red": "High"
                                };
                            var degreeChange = degreesChangeDict[vessel.displayColor];
                            row =`<tr id =${rowId} >
                                    <td>${vessel.abbrVslM}</td>
                                    <td>${vessel.inVoyN}</td>
                                    <td>${vessel.outVoyN}</td>
                                    <td>${vessel.bthgDt}</td>
                                    <td>${vessel.unbthgDt}</td>
                                    <td>${vessel.berthN}</td>
                                    <td>${vessel.status}</td>
                                    <td style="text-align: center;">${vessel.changeCount}</td>
                                    <td style="background-color: ${vessel.displayColor};">${degreeChange}</td>
                                    <td style="text-align: center;"><button type= "button" class="btn btn-outline-primary" onclick='deleteFavorite("${email}","${vessel.abbrVslM}","${vessel.inVoyN}" )'>Remove</button></td>
                                </tr>`;
                                            
                            // rows += "<tr>" + eachRow + "</tr>";
                            $('#thebody').append(row);
                                
                        }catch (err) {
                            alert("Invalid email");
                        }
                    }else if( request.readyState == 4 && request.status == 404 ) {
                        console.log('Fail to retrieve request');
                    }
                }    


            }


            function deleteFavorite(email, abbrVslM, inVoyN) {
                alert("Delete "+abbrVslM +" "+inVoyN +" from My favorites?")
                var request = new XMLHttpRequest();

                var url = `http://localhost:9100/deleteFavorite`;

                request.open("DELETE", url, true);
                request.setRequestHeader("Content-type", "application/json;charset=UTF-8");
                request.send(JSON.stringify({
                    "email": email,
                    "inVoyN": inVoyN,
                    "abbrVslM": abbrVslM
                }));

                var toDeleteRowId = "#" +abbrVslM + inVoyN;
                toDeleteRowId =toDeleteRowId .replace(/ /g,'');
                $(toDeleteRowId).remove()

                // $('#thebody').empty();
                // findFavoritesByUser(email);
            
            }
            
        </script>
    </body> 
    <!-- ! ========== BODY END =============== -->
</html>