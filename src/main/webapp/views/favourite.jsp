<html>
    <head>My Favourites</head>

    <body>
        <div class="container">
            <table>
                <thead>
                <tr><th>Vessel's Name</th><th>Incoming Voyage Number</th><th>Outgoing Voyage Number</th><th>Berthing Time</th>
                    <th>Departure Time</th><th>Berth Number</th><th>Status</th><th>Change Count</th>
                    <th>Degree of change in vessel's arrival timing (Yellow = < 1 Hour, Red = > 1 Hour)</th>
                </tr>
                </thead>

                <form method="post" action="sortFavourite">
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
                </form>

                <c:forEach items="${favouriteList}" var="favourite">
                    <tbody>
                    <tr>
                        <td><c:out value="$(favourite.abbrVslM)"/></td>
                        <td><c:out value="$(favourite.inVoyN)"/></td>
                        <td><c:out value="$(favourite.outVoyN)"/></td>
                        <td><c:out value="$(favourite.btrDt)"/></td>
                        <td><c:out value="$(favourite.etdDt)"/></td>
                        <td><c:out value="$(favourite.berthN)"/></td>
                        <td><c:out value="$(favourite.status)"/></td>
                        <td>#getting change count</td>
                        <td>#getting degree of change</td>
                        <form action="/editFavourite">
                            <td><input type="button" name="editFavBtn" value="Edit"/></td>
                        </form>
                        <form action="/deleteFavorite">
                            <td><input type="button" name="deleteFavBtn" value="Delete"/></td>
                        </form>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>

            <br/>

        </div>
    </body>
</html>