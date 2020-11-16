<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> 

    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <span class="navbar-brand mb-0 h1">PSA Vessel Tracking Portal</span>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="goMainPage()">Main</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#" >Favorite</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="logout()" >Logout</a>
                </li>
                </ul>
                <br>
            </div>
        </nav>
    <head>
        <%-- <div class="row"> 

            <div class="col-md-9"> 
                <h1 class="display-4">My Favorite</h1>
            </div>
            <div class="col-md-2">
                <button style="float: right;" id="goMainPage" class="btn btn-primary" onclick="goMainPage()">Main Page</button>
            </div>
            <div class="col-md-1">
                <button id="logout" class="btn btn-secondary" onclick="logout()" style="float: right;">Logout</button>
            </div>
        </div>
         --%>
    </head>

    <body>
        <br>
        <div class="table">
            <table id="mytable">
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

                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script>
                    var email= sessionStorage.getItem("email");
                    console.log("session "+email);
                    if(email == null){
                        logout();
                    }

                    findFavoritesByUser(email);
                    
                    function goMainPage(){
                        window.location.replace("http://localhost:9100/vesselschedules");
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
                                    console.log(vessel);
                                    var rowId = vessel.abbrVslM + vessel.inVoyN;
                                    rowId= rowId .replace(/ /g,'');
                                    console.log(rowId);
                                    row =`<tr id =\${rowId} >
                                            <td>\${vessel.abbrVslM}</td>
                                            <td>\${vessel.inVoyN}</td>
                                            <td>\${vessel.outVoyN}</td>
                                            <td>\${vessel.bthgDt}</td>
                                            <td>\${vessel.unbthgDt}</td>
                                            <td>\${vessel.berthN}</td>
                                            <td>\${vessel.status}</td>
                                            <td style="text-align: center;">\${vessel.changeCount}</td>
                                            <td style="background-color: \${vessel.displayColor};">\${vessel.displayColor}</td>
                                            <td style="text-align: center;"><button type= "button" class="btn btn-outline-primary" onclick='deleteFavorite("\${email}","\${vessel.abbrVslM}","\${vessel.inVoyN}" )'>Remove</button></td>
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

            

                
                <%-- <form method="post" action="sortFavourite">
                    Sort By:
                    <select id="categories">
                        <option value="abbrVslM">Vessel's Name</option>
                        <option value="inVoyN">Incoming Voyage Number</option>
                        <option value="outVoyN">Outgoing Voyage Number</option>
                        <option value="btrDt">Berthing Time</option>
                        <option value="etdDt">Departure Time</option>
                        <option value="berthN">Berth Number</option>
                        <option value="status">Status</option>
                        <option value="changeCount">Change Count</option>
                        <option value="degChange">Degree of change</option>
                    </select>
                    <input type="search" name="searchFav"/>
                </form> --%>

              </tbody>
            </table>

            <br/>

        </div>
        
    </body>
    </div>
</html>