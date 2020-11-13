<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="styles/style.js"></script>
</head>

<div class="container">
    <h1>Vessel Schedule</h1><br/>
    Select day to view: <input type="date" id="currentDate"/>
    <input type="button" name="btnSelectDay" value="Search"/>

    <table border="1">
        <thead>
        <tr>
            <th>Vessel's name</th><th>Incoming Voyage Number</th><th>Outgoing Voyage Number</th><th>Berthing Time</th>
            <th>Departure Time</th><th>Berth Number</th><th>Status</th><th>Change Count</th>
            <th>Degree of change in vessel's arrival timing (Yellow = < 1 Hour, Red = > 1 Hour)</th>
        </tr>
        </thead>


    </table>
</div>