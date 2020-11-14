<html>
    <head>
        <script>
            $(document).ready(function () {
                monthShortNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
                ];

                n = new Date();
                y = n.getFullYear();
                m = monthShortNames[n.getMonth()];
                d = n.getDate();

                var currentDate = document.getElementById("currentDate");

                document.querySelector('#currentDate').setAttribute('value', d + "-" + m + "-" + y);
                document.querySelector('#currentDate').setAttribute('min', d + "-" + m + "-" + y);
                document.querySelector('#currentDate').setAttribute('max', d+7);
            });
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Vessel Schedule</h1><br/>
            Select day to view: <input type="date" id="currentDate" placeholder="Date"/>
            <input type="button" name="btnSelectDay" value="Search"/><br/>

            <br/>
            <table border="1">
                <thead>
                <tr>
                    <th>Vessel's name</th><th>Incoming Voyage Number</th><th>Outgoing Voyage Number</th><th>Berthing Time</th>
                    <th>Departure Time</th><th>Berth Number</th><th>Status</th><th>Change Count</th>
                    <th>Degree of change in arrival timing (Yellow = < 1 Hour, Red = > 1 Hour)</th>
                </tr>
                </thead>
            </table>
        </div>
    </body>
</html>