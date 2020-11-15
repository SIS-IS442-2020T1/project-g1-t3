<html>
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

    <%-- <input id="selectedDate" type="date" min="2020-11-14"  max ="2020-11-16" required> --%>
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
    <%-- <input type="search" name="searchFav"/> --%>
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

                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script>
                
                    // $(document).ready(function(){
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
                            // var allVessels = await getAllVessels();
                            // // console.log(allVessels);
                            

                            var selectedDate = $('#selectedDate').val();
                            if(selectedDate==""){
                                // var firstDate = new Date();
                                // selectedDate = firstDate.toISOString().substring(0, 10);
                                selectedDate = min;
                            }
                            // console.log("hi"+selectedDate);
                            // window.location.replace("http://localhost:9100/vesselschedules?date="+date);
                            // var vessels = "${vessels}";
                            var email = "${email}";
                            console.log(email);
                            // array or array.length are falsy
                            if (!allVessels || !allVessels.length) {
                                alert('Vessel list empty or undefined.');

                            }else{
                                toSort(allVessels);
                                var rows = "";
                                    for (const vessel of allVessels) {
                                        if(vessel.bthgDt.startsWith(selectedDate)){
                                            var name = vessel.abbrVslM;
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
                                            '<td style="background-color:'+vessel.displayColor+';">'+ vessel.displayColor + "</td>" +
                                            '<td><button type= "button" class="btn btn-primary" onclick="AddFavoriteOrSubscribe('+ email+ ',' +vessel.abbrVslM+ ','+ vessel.inVoyN+','+ typeFavorite +')">Add</button></td>' +
                                            '<td><button type= "button" class="btn btn-primary" onclick="AddFavoriteOrSubscribe('+ email+ ',' +vessel.abbrVslM+ ','+ vessel.inVoyN+','+typeSubscription +')">Subscribe</button></td>';
                                            
                                            rows += "<tr class="+ selectedDate +">" + eachRow + "</tr>";
                                        }
                                
                                    }
                                // $("#testTable").find("tbody").empty();
                                $('#thebody').empty();
                                $('#thebody').append(rows);
                             }
                        // $mytable.dataTable().fnDraw(); // Manually redraw the table after filtering
                        }catch (error) {
                           console.log(error);
                        }
                    }



                    function toSort(allVessels){
                        // var $mytable = $('#mytable');
                        var sortBy = $('#sort').val();
                        console.log("sort by"+sortBy);
                        if(sortBy == "abbrVslM" ){
                            allVessels.sort(function(a, b) {
                                return (a.abbrVslM < b.abbrVslM ? -1 : (a.abbrVslM > b.abbrVslM ? 1 : 0)); 
                            });
                            // console.log(allVessels);
                        }else if(sortBy == "inVoyN" ){
                            allVessels.sort(function(a, b) {
                                return (a.inVoyN < b.inVoyN ? -1 : (a.inVoyN > b.inVoyN ? 1 : 0));      
                            });
                        }else if(sortBy == "outVoyN" ){
                            allVessels.sort(function(a, b) {
                                return (a.outVoyN < b.outVoyN ? -1 : (a.outVoyN > b.outVoyN ? 1 : 0));      
                            });
                        }else if(sortBy == "bthgDt" ){
                            allVessels.sort(function(a, b) {
                                return (a.bthgDt < b.bthgDt ? -1 : (a.bthgDt > b.bthgDt ? 1 : 0));      
                            });
                        }else if(sortBy == "unbthgDt" ){
                            allVessels.sort(function(a, b) {
                                return (a.unbthgDt < b.unbthgDt ? -1 : (a.unbthgDt > b.unbthgDt ? 1 : 0));      
                            });
                        }else if(sortBy == "berthN" ){
                            allVessels.sort(function(a, b) {
                                return (a.berthN < b.berthN ? -1 : (a.berthN > b.berthN ? 1 : 0));      
                            });
                        }else if(sortBy == "status" ){
                            allVessels.sort(function(a, b) {
                                return (a.status < b.status ? -1 : (a.status > b.status ? 1 : 0));      
                            });
                        }else if(sortBy == "changeCount" ){
                            allVessels.sort(function(a, b) {
                                return a.changeCount - b.changeCount;      
                            });
                        }else if(sortBy == "displayColor" ){
                            allVessels.sort(function(a, b) {
                                return (a.displayColor < b.displayColor ? -1 : (a.displayColor > b.displayColor ? 1 : 0));      
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
                            // Step 5
                            if( this.readyState == 4 && this.status == 200 ) {
                                // Response is ready
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