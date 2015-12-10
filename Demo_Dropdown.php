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
							$sql1="CALL intelapp.ListLocations()";
							$result = $conn->query($sql1);;
							echo "<select name=\"Locat\">";
							echo "<option size =30 ></option>";
							while($row = mysql_fetch_array($result)) 
							{        
							echo "<option value='".$row['location']."'>".$row['location']."</option>"; 
							}
							echo "</select>";
				$conn->close();
			?>	