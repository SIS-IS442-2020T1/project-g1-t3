<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
    <div class="container">
    <head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <h1>My Favorites</h1>
    
    <style>
        table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
        text-align: center;
        }
    </style>
    </head>

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
                        <th>To delete from My Favorties</th>
                    </tr>
                </thead>

                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
                <script>
                    $(document).ready(function(){
                        $("button").click(function(){
                            // e.preventDefault();
                            $("#mytable").remove();
                            document.location.reload();
                        });
                    });
                    function deleteFavorite(email, abbrVslM, inVoyN) {
                        
                        var request = new XMLHttpRequest();

                        var url = `http://localhost:9100/deleteFavorite`;

                        request.open("DELETE", url, true);
                        request.setRequestHeader("Content-type", "application/json;charset=UTF-8");
                        request.send(JSON.stringify({
                            "email": email,
                            "inVoyN": inVoyN,
                            "abbrVslM": abbrVslM
                        })); // query parameters
                        // $("#table").remove();
                        // document.location.reload();
                        // var id1 = '#'+abbrVslM; 
                        // $(id1).remove();
                        // document.location.reload();

                    }
                   
                </script>

                <c:forEach items="${vessels}" var="vessel">
                    <tbody>
                        <%-- <% 
                            import java.util.*;
                            import g1t3.entity.*; 
                            List<Vessel> vesselList = request.getParameterValues("vessels");
                            for<Vessel v : vesselList>{
                                if(v.get)
                            }
                        %> --%>
                    <tr id ="${vessel.abbrVslM}" >
                        <td>${vessel.abbrVslM}</td>
                        <td>${vessel.inVoyN}</td>
                        <td>${vessel.outVoyN}</td>
                        <td>${vessel.bthgDt}</td>
                        <td>${vessel.unbthgDt}</td>
                        <td>${vessel.berthN}</td>
                        <td>${vessel.status}</td>
                        <td>${vessel.changeCount}</td>
                        <td style="background-color: ${vessel.displayColor};">${vessel.displayColor}</td>
                        <%-- <td><input type="button" name="deleteFavBtn" value="Delete" action= "/deleteFavorite"/></td> --%>
                        <td><button type= "button" class="btn btn-primary" onclick='deleteFavorite("${email}","${vessel.abbrVslM}","${vessel.inVoyN}" )'>Delete</button></td>
                        <%-- <form action="/editFavourite">
                            <td><input type="button" name="editFavBtn" value="Edit"/></td>
                        </form>
                        <form action="/deleteFavorite">
                            <td><input type="button" name="deleteFavBtn" value="Delete"/></td>
                        </form> --%>


                    </tr>
                    </tbody>
                </c:forEach>

                
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

              
            </table>

            <br/>

        </div>
        
    </body>
    </div>
</html>