<html>
<head>
    <style>
    <style>
        table {
        border-collapse: collapse;
        width: 100%;
        }
        th, td {
        text-align: left;
        padding: 8px;
        }
        tr:nth-child(even){background-color: #f2f2f2}
    </style>
    </style>
</head>
<body>
<form action="report.php" method="get">
    <table>
    <tr>
        <th>Location:<input type="text" name="locat"></th>
        <th> Start Date: <input type="date" name="strdte"></th>
        <th> End Date: <input type="date" name="enddte"></th>
        <th><input type="submit"></th>
    </tr>
</form>
<?php
		$servername = "localhost";
		$username   = "root";
		$password   = "";
		$dbname     = "intelapp";
		
		// Create connection
		$conn = new mysqli($servername, $username, $password, $dbname);
		// Check connection
		if ($conn->connect_error) {
						die("Connection failed: " . $conn->connect_error);
		}
		
		$sql    = "CALL intelapp.annaporna_report (NULL,'2015-07-14','2015-08-26')";
		$result = $conn->query($sql);
		
		if ($result->num_rows > 0) {
						echo "<table>
									<tr>
										<th>Location</th>
										<th>Feedback</th>
										<th>Quality Of Food</th>
										<th>Quality Of Service (Staff Behaviour)</th>
										<th>Time taken to food serve </th>
										<th>Ambience and Cleanliness</th>
										<th>Over all experiences </th>
									</tr>";
						// output data of each row
						while ($row = $result->fetch_assoc()) {
										echo "<tr><td>" . $row["primarylocation"] . "</td><td>" . $row["feedback"] . "</td><td>" . $row["perct_q1"]. "</td><td>" . $row["perct_q2"]. "</td><td>" . $row["perct_q3"]. "</td><td>" . $row["perct_q4"]. "</td><td>" . $row["perct_q5"] . "</td></tr>";
						}
						echo "</table>";
		} else {
						echo "0 results";
		}
		
		$conn->close();
?>  

</body>
</html>




 

