<!DOCTYPE html>
<html lang="en">
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
                                        <a id="welcome" style='font-size: 15px;'>Welcome to PSA Portnet</a>
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
                            <div class="col-md-3" style='margin: 0px 0px 0px 0px'>
                                <img src="login/images/psa-logo-white.png" width="130px" height="50px" alt="logo">
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
                                                    <a href="#">Main</a>
                                                </li>
    
                                                <li>
                                                    <a href="#" onclick=goFavoritePage()>Favourites</a>
                                                </li>
                                                <li>
                                                    <a href="#" onclick='goSubscriptionPage()'>Subscription</a>
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
                                <h1>Vessel Timings</h1>
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
                <div class="form-group">
                    <label for="selectedDate">Date</label>
                    <input class="form-control" id="selectedDate" type="date" required>
                </div>
                <div class="form-row">  
                    <div class="form-group col-md-6"> 
                        <label for="sort">Sort By</label>
                        <select class="form-control" id="sort">
                            <option value="abbrVslM">Vessel's Name</option>
                            <option value="inVoyN">Incoming Voyage Number</option>
                            <option value="outVoyN">Outgoing Voyage Number</option>
                            <option value="btrDt">Berthing Time</option>
                            <option value="etdDt">Departure Time</option>
                            <option value="berthN">Berth Number</option>
                            <option value="status">Status</option>
                            <option value="changeCount">Change Count</option>
                            <option value="displayColor">Degree of change</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6"> 
                    
                        <label for="sortingOrder">Order by</label>
                        <select class="form-control" id="sortingOrder">
                            <option value="A">Ascending</option>
                            <option value="D">Descending</option>
                        </select>
                    </div>
                </div>

                <button id="confirm" class="btn btn-success" onclick="filterAndDisplay()" style="float: right; margin-bottom:20px; font-size: 20px">SORT</button> 
                <br><br>
                
                <!-- =========================================================== TABLES ========================================================-->

                

                <div class="panel" >
                    <table id="mytable" class="table">
                        <thead>
                            <tr style='background-color: #eaeaea; color:#222845;'   >
                                <th>Vessel's Name</th>
                                <th>Incoming Voyage Number</th>
                                <th>Outgoing Voyage Number</th>
                                <th>Berthing Time</th>
                                <th>Departure Time</th>
                                <th>Berth Number</th>
                                <th>Status</th>
                                <th>Change Count</th>
                                <th>Degree of change</th>
                                <th>Add to Favorites</th>
                                <th>Subscribe</th>
                            </tr>
                        </thead>
                            <tbody id="thebody">
        
                            <tbody>
                    </table>
                </div>
            </div>


            <!-- ! ===================================== FOOTER =====================================-->
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

            

        </div>
        <!--// Final Div \\-->

        

    
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
    
    <!-- Latest compiled and minified CSS -->

    <!-- Latest compiled and minified JavaScript -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>

    <script>
        var email= sessionStorage.getItem("email");
        console.log("session "+email);
        if(email == null){
            logout();
        }
        var $mytable = $('#mytable');

        var firstDate = new Date();
        min = firstDate.toISOString().substring(0, 10);
        console.log(min);

        var lastDate = new Date();
        lastDate.setDate(lastDate.getDate() + 6);
        var max = lastDate.toISOString().substring(0, 10);
        console.log(max);

        var input = document.getElementById("selectedDate");
        input.setAttribute("min",min);
        input.setAttribute("max",max);

        filterAndDisplay();

        function goFavoritePage(){
            window.location.replace("./myfavorite");
        }

        function goSubscriptionPage(){
                window.location.replace("./subscription");
        }


        function logout(){
            sessionStorage.clear();
            window.location.replace("http://localhost:9100/login");
        }

        async function filterAndDisplay(){
            // e.preventDefault();
            try {
                var url = `http://localhost:9100/vessels`;
                const response =await fetch(url, { method: 'GET' } );
                const allVessels= await response.json();

                var selectedDate = $('#selectedDate').val();
                if(selectedDate==""){// if no day is selected, set today as the date
                    selectedDate = min;
                }
                
                if (!allVessels || !allVessels.length) {
                    alert('Vessel list empty or undefined.');

                }else{
                    toSort(allVessels);
                    var rows = "";
                        for (const vessel of allVessels) {
                            if(vessel.bthgDt.startsWith(selectedDate)){
                                var typeFavorite = "F";
                                var typeSubscription = "S";

                                    var degreesChangeDict = {
                        
                                    "white": "No Change",
                                    "yellow": "Medium",
                                    "red": "High"
                                };
                                var degreeChange = degreesChangeDict[vessel.displayColor];
        
                                var FavoriteButtonId = vessel.abbrVslM+vessel.inVoyN+typeFavorite;
                                FavoriteButtonId=FavoriteButtonId.replace(/ /g,'');
                                // console.log(FavoriteButtonId);
                                var SubscribeButtonId = vessel.abbrVslM+vessel.inVoyN+typeSubscription;
                                SubscribeButtonId=SubscribeButtonId.replace(/ /g,'');
                                // console.log(SubscribeButtonId);
                                eachRow =
                                `<td>${vessel.abbrVslM}</td>
                                <td>${vessel.inVoyN}</td>
                                <td>${vessel.outVoyN}</td>
                                <td>${vessel.bthgDt}</td>
                                <td>${vessel.unbthgDt}</td>
                                <td>${vessel.berthN}</td>
                                <td>${vessel.status}</td>
                                <td style="text-align: center;">${vessel.changeCount}</td>
                                <td style="background-color: ${vessel.displayColor};">${degreeChange}</td>
                                <td><button type= "button" id=${FavoriteButtonId} class="btn btn-warning" onclick='AddFavoriteOrSubscribe("${email}","${vessel.abbrVslM}","${vessel.inVoyN}","${typeFavorite}" )'>ADD</button></td>
                                <td><button type= "button" id=${SubscribeButtonId} class="btn btn-danger" onclick='AddFavoriteOrSubscribe("${email}","${vessel.abbrVslM}","${vessel.inVoyN}","${typeSubscription}" )'>SUBSCRIBE</button></td>`;
                                        
                                rows += "<tr>" + eachRow + "</tr>";
                                
                            }
                    
                        }
                    // $("#table").find("tbody").empty();
                    $('#thebody').empty();
                    $('#thebody').append(rows);
                }
            }catch (error) {
                console.log(error);
            }
        }

        function toSort(allVessels){
            var sortBy = $('#sort').val();
            var order = $('#sortingOrder').val();
            // console.log("sort by "+sortBy);
            // console.log("order "+order);
            if(sortBy == "abbrVslM" ){
                allVessels.sort(function(a, b) {
                    if(order=="A"){
                        return (a.abbrVslM < b.abbrVslM ? -1 : (a.abbrVslM > b.abbrVslM ? 1 : 0)); 
                    }else if(order=="D"){
                        return -(a.abbrVslM < b.abbrVslM ? -1 : (a.abbrVslM > b.abbrVslM ? 1 : 0)); 
                    }
                });
            }else if(sortBy == "inVoyN" ){
                allVessels.sort(function(a, b) {
                    if(order=="A"){
                        return (a.inVoyN < b.inVoyN ? -1 : (a.inVoyN > b.inVoyN ? 1 : 0)); 
                    }else if(order=="D"){
                        return -(a.inVoyN < b.inVoyN ? -1 : (a.inVoyN > b.inVoyN ? 1 : 0));
                    }     
                });
            }else if(sortBy == "outVoyN" ){
                allVessels.sort(function(a, b) {
                    if(order=="A"){
                        return (a.outVoyN < b.outVoyN ? -1 : (a.outVoyN > b.outVoyN ? 1 : 0));  
                    }else if(order=="D"){
                        return -(a.outVoyN < b.outVoyN ? -1 : (a.outVoyN > b.outVoyN ? 1 : 0));  
                    }  
                        
                });
            }else if(sortBy == "btrDt" ){
                allVessels.sort(function(a, b) {
                    time1 = new Date(a.bthgDt );
                    time2 = new Date(b.bthgDt);
                    if(order=="A"){
                        return time1-time2;
                    }else if(order=="D"){
                        return time2-time1;
                    }  
                            
                });
            }else if(sortBy == "etdDt" ){
                allVessels.sort(function(a, b) {
                    time1 = new Date(a.unbthgDt);
                    time2 = new Date(b.unbthgDt);
                    if(order=="A"){
                        return time1-time2;
                    }else if(order=="D"){
                        return time2-time1;
                    }         
                });
            }else if(sortBy == "berthN" ){ // TODO: wrong order
                allVessels.sort(function(a, b) {
                    if(a.berthN==null){
                        var number1 = "zzzzz";
                    }else{
                        var number1 = a.berthN;
                    }

                    if(b.berthN==null){
                        var number2 = "zzzzz";
                    }else{
                        var number2 = b.berthN;
                    }
                    
                    if(order=="A"){
                        // return (a.berthN < b.berthN ? -1 : (a.berthN > b.berthN ? 1 : 0));
                        return number1.localeCompare(number2, undefined, {
                                numeric: true,
                                sensitivity: 'base'
                                });
                    }else if(order=="D"){
                        return number2.localeCompare(number1, undefined, {
                                numeric: true,
                                sensitivity: 'base'
                                });
                    }       
                });
            }else if(sortBy == "status" ){
                allVessels.sort(function(a, b) {
                    if(order=="A"){
                        return (a.status < b.status ? -1 : (a.status > b.status ? 1 : 0)); 
                    }else if(order=="D"){
                        return -(a.status < b.status ? -1 : (a.status > b.status ? 1 : 0));
                    }       
                });
            }else if(sortBy == "changeCount" ){
                allVessels.sort(function(a, b) {
                    if(order=="A"){
                        return a.changeCount - b.changeCount; 
                    }else if(order=="D"){
                        return b.changeCount - a.changeCount; 
                    }       
                });
            }else if(sortBy == "displayColor" ){
                allVessels.sort(function(a, b) {
                    var degreeOfChange = {
                        null:4,
                        "white": 3,
                        "yellow": 2,
                        "red": 1
                    };
                    if(order=="A"){
                        return degreeOfChange[b.displayColor]-degreeOfChange[a.displayColor];
                    }else if(order=="D"){
                        return degreeOfChange[a.displayColor]-degreeOfChange[b.displayColor];
                    }  
                    // console.log(a.displayColor);
                    // console.log(degreeOfChange[a.displayColor]);
                    
                });
            }
            
        }


    //    function getAllVessels() {                       
    //         var request = new XMLHttpRequest();
    //         var url = `http://localhost:9100/vessels`;
    //         request.open("GET", url, true);
    //         request.send();
    //         request.onreadystatechange = function() {
    //             if( this.readyState == 4 && this.status == 200 ) {
    //                 // Response is ready
    //                 console.log('success');
    //                 var json_obj = JSON.parse(request.responseText);
    //                 // console.log(json_obj);
    //                 return json_obj;
    //             }else if( request.readyState == 4 && request.status == 404 ) {
    //                 console.log('Fail to retrieve request')
    //                 return "fail";
    //             }
    //         }
            
    //    }

    
        function AddFavoriteOrSubscribe(email, abbrVslM, inVoyN, type ) {
            // alert("adding");
            var request = new XMLHttpRequest();
            var url =``;
            var alert = "";
            if(type == "F" ){
                url = `http://localhost:9100/addFavorite`;
              
            }else if(type == "S"){
                url = `http://localhost:9100/addSubscription`;
               
            }
            

            request.open("POST", url, true);
            request.setRequestHeader("Content-type", "application/json;charset=UTF-8");
            request.send(JSON.stringify({
                "email": email,
                "inVoyN": inVoyN,
                "abbrVslM": abbrVslM
            })); 

            var ButtonId = "#"+abbrVslM + inVoyN + type;
            ButtonId=ButtonId.replace(/ /g,'');
            // console.log(ButtonId);

            request.onreadystatechange = function() {
                if( this.readyState == 4 && this.status == 200 ) {
                    console.log('success');
                    $(ButtonId).prop("disabled",true);
                    alert("Successfully added");
                }
                else{
                    console.log(this.status);
                }
            };
        }
        
</script>

        
</body>
</html>