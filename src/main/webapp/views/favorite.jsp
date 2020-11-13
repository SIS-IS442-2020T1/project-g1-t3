<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>

    <head>
    
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
        <div class="container">
            <table>
                <thead>
                <tr><th>Vessel's Name</th><th>Incoming Voyage Number</th><th>Outgoing Voyage Number</th><th>Berthing Time</th>
                    <th>Departure Time</th><th>Berth Number</th><th>Status</th><th>Change Count</th>
                    <th>Degree of change in vessel's arrival timing (Yellow = < 1 Hour, Red = > 1 Hour)</th>
                </tr>
                </thead>
        


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
                    <tr>
                        <td>${vessel.abbrVslM}</td>
                        <td>${vessel.inVoyN}</td>
                        <td>${vessel.outVoyN}</td>
                        <td>${vessel.bthgDt}</td>
                        <td>${vessel.unbthgDt}</td>
                        <td>${vessel.berthN}</td>
                        <td>${vessel.status}</td>
                        <td>${vessel.changeCount}</td>
                        <td>#getting degree of change</td>
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
</html>