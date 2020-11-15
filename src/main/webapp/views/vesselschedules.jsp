<%-- <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> --%>

<script 
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
    crossorigin="anonymous"></script>
    
    <script 
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
    integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
    crossorigin="anonymous">
</script>
<html>
    <div class="container">
    <head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <h1>Vessel Schedule</h1>
    
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
    </head>


   
    <%-- <input id="selectedDate" type="date" min="2020-11-14"  max ="2020-11-16" required> --%>
    <input id="selectedDate" type="date" required>
    <button id="filter" onclick="filterAndDisplay()">Filter</button>


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
                <tbody id="tbody">

                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script>
                
                    $(document).ready(function(){
                        var $mytable = $('#mytable');
                        var firstDate = new Date();
                        min = firstDate.toISOString().substring(0, 10);
                        console.log(min);

                        var lastDate = new Date();
                        lastDate.setDate(lastDate.getDate() + 7);
                        var max = lastDate.toISOString().substring(0, 10);
                        console.log(max);

                        var input = document.getElementById("selectedDate");
                        // input.setAttribute("value",min);
                        input.setAttribute("min",min);
                        input.setAttribute("max",max);
                        // window.location.replace("http://localhost:9100/vesselschedules?date="+min);
                        // var vessels = getAllVessels();
                        // filterAndDisplay();
                        // sort();

                    });

                    // $('#filter').on('click', function(e){
                    async function filterAndDisplay(){
                        // e.preventDefault();
                        // $('#tbody').remove();
                        try {
                            var url = `http://localhost:9100/vessels`;
                            const response =await fetch(url, { method: 'GET' } );
                            const allVessels= await response.json();
                            // var allVessels = await getAllVessels();
                            console.log(allVessels);
                            var selectedDate = $('#selectedDate').val();
                            console.log(selectedDate);
                            // window.location.replace("http://localhost:9100/vesselschedules?date="+date);
                            // var vessels = "${vessels}";
                            var email = "${email}";
                            console.log(email);
                            // array or array.length are falsy
                            if (!allVessels || !allVessels.length) {
                                alert('Vessel list empty or undefined.');
                            } else {
                                
                                var rows = "";
                                    for (const vessel of allVessels) {
                                        if(vessel.bthgDt.startsWith(selectedDate)){
                                            eachRow =
                                            "<td>" + vessel.inVoyN + "</td>" +
                                            "<td>" + vessel.inVoyN + "</td>" +
                                            "<td>" + vessel.outVoyN + "</td>" +
                                            "<td>" + vessel.bthgDt + "</td>" +
                                            "<td>" + vessel.unbthgDt + "</td>" +
                                            "<td>" + vessel.berthN + "</td>" +
                                            "<td>" + vessel.status + "</td>" +
                                            "<td>" + vessel.changeCount + "</td>" +
                                            '<td style="background-color:'+vessel.displayColor+';">'+ vessel.displayColor + "</td>" +
                                            '<td><button type= "button" class="btn btn-primary" onclick=AddFavoriteOrSubscribe('+ email+ ',' +vessel.abbrVslM+ ','+vessel.inVoyN+','+ 'F'+')>Add</button></td>' +
                                            '<td><button type= "button" class="btn btn-primary" onclick=AddFavoriteOrSubscribe('+ email+ ',' +vessel.abbrVslM+ ','+vessel.inVoyN+','+ 'S'+')>Subscribe</button></td>';
                                            
                                            rows += "<tr>" + eachRow + "</tr>";
                                        }
                                
                                    }
                                // $('#tbody').remove();
                                $('#tbody').append(rows);
                             }
                        // $mytable.dataTable().fnDraw(); // Manually redraw the table after filtering
                        }catch (error) {
                           console.log(error);
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

               

                    function AddFavoriteOrSubscribe(email, abbrVslM, inVoyN, type) {
                        
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