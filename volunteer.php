<!DOCTYPE html>
<html>
<head>
  <title>PHP Test</title>
</head>
<body>
 <?php
    $servername = "localhost";
    $dbname = "INFM603";
    $username = "root";
    $password = "root";
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
    } 
?> 
<table>
  <tr>
    <th>Center Name</th>
    <th>Volunteer Name</th>
    <th>Latest COVID-19 Test</th>
  </tr>
  <?php
    $name = $_GET['name'];
    $email = $_GET['email'];
    $address = $_GET['address'];
    $date = $_GET['date'];
    $location = $_GET['location'];
    $sql = "INSERT INTO volunteers (volunteer_id, center_id, name, email, latest_test)
              VALUES(DEFAULT, $location, $name, $email, $date)";
    $sql = "SELECT center_name, name, latest_test FROM centers 
            JOIN volunteers USING (center_id)
            ORDER BY center_name, name";
            
    $result = $conn->query($sql) or die($conn->error);
    while ($row = $result->fetch_assoc())
    {
      echo("<tr><td>".$row["center_name"]."</td><td>".$row["name"]."</td><td>".$row["latest_test"]."</td></tr>");
    }
  ?>
</table>
</body>
</html>
