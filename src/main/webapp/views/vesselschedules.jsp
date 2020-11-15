<!DOCTYPE html>
<html lang="en">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> 
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 75%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
    </style>

    <div class="container">
    <head>
    <h1>Vessel Schedule</h1>
    </head>
    Date:
    <input id="selectedDate" type="date" required>
    
    Sort By:
    <select id="sort">
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

    Order by:
    <select id="sortingOrder">
        <option value="A">Ascending</option>
        <option value="D">Descending</option>
    </select>

    <button id="confirm" onclick="filterAndDisplay()">Confirm</button>

    <body>
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
                        <th>Degree of change</th>
                        <th>Add to Favorties</th>
                        <th>Subscribe</th>
                    </tr>
                </thead>
                <tbody id="thebody">

                <!-- Latest compiled and minified CSS -->
                <%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
                    integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> --%>

                <!-- Latest compiled and minified JavaScript -->
                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
                    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
                    crossorigin="anonymous"></script>

                <script>
                    // $(document).ready(function(){
                    var email= sessionStorage.getItem("email");
                    console.log(email);
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

                    // window.location.replace("http://localhost:9100/vesselschedules?date="+min);
                    // filterAndDisplay();
                    filterAndDisplay();
   
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
             
                            var email = "${email}";
                            console.log(email);
                         
                            if (!allVessels || !allVessels.length) {
                                alert('Vessel list empty or undefined.');

                            }else{
                                toSort(allVessels);
                                var rows = "";
                                    for (const vessel of allVessels) {
                                        if(vessel.bthgDt.startsWith(selectedDate)){
                                            var typeFavorite = "F";
                                            var typeSubscription = "S";
                    
                                            eachRow =
                                            // `<td>${vessel.abbrVslM}</td>` +
                                            "<td>" + vessel.abbrVslM + "</td>" +
                                            "<td>" + vessel.inVoyN + "</td>" +
                                            "<td>" + vessel.outVoyN + "</td>" +
                                            "<td>" + vessel.bthgDt + "</td>" +
                                            "<td>" + vessel.unbthgDt + "</td>" +
                                            "<td>" + vessel.berthN + "</td>" +
                                            "<td>" + vessel.status + "</td>" +
                                            "<td>" + vessel.changeCount + "</td>" +
                                            '<td style="background-color:'+ vessel.displayColor +';">'+ vessel.displayColor + "</td>" +
                                            '<td><button type= "button" class="btn btn-primary" onclick="AddFavoriteOrSubscribe('+email+','+vessel.abbrVslM +','+ vessel.inVoyN +','+ typeFavorite +')">Add</button></td>' +
                                            '<td><button type= "button" class="btn btn-primary" onclick="AddFavoriteOrSubscribe('+email+','+vessel.abbrVslM+','+vessel.inVoyN+','+ typeSubscription +')">Subscribe</button></td>';
                                            
                                            rows += "<tr>" + eachRow + "</tr>";
                                            // rows += "<tr><td> </td><tr>";
                                            
                                        }
                                
                                    }
                                // $("#testTable").find("tbody").empty();
                                $('#thebody').empty();
                                $('#thebody').append(rows);
                            }
                        }catch (error) {
                           console.log(error);
                        }
                    }

                    function toSort(allVessels){
                        // var $mytable = $('#mytable');
                        var sortBy = $('#sort').val();
                        var order = $('#sortingOrder').val();
                        console.log("sort by "+sortBy);
                        console.log("order "+order);
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

                    async function getVessels(){
                        try {
                            // var $rows = $('#'+selectedDate);
                            var url = `http://localhost:9100/vessels`;
                            const response =await fetch(url, { method: 'GET' } );
                            const allVessels= await response.json();
                            filterAndDisplay(allVessels);
                            // return allVessels;
                            
                        }catch (error) {
                            return "";
                            // console.log(error);
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
                        alert("adding");
                        var request = new XMLHttpRequest();
                        var url =``;
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
                        request.onreadystatechange = function() {
                            if( this.readyState == 4 && this.status == 200 ) {
                                console.log('success');
                                alert('adding to favortie'+ request.responseText);
                            }
                            else{
                                console.log(this.status);
                            }
                        };
                    }
                    
            </script>


            <tbody>
        </table>

            

        </div>
        
    </body>
     </div>
</html>