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
    $address = $_GET['address'];
    $test_date = $_GET['test_date'];
    $delivery_date = $_GET['delivery_date'];

    $restrictions = $_GET['restrictions'];
    $supplies = $_GET['supplies'];
    $id = rand()
    
    $sql = "INSERT INTO patients (patient_id, name, address, test_date, delivery_date) VALUES ('$id', '$name', '$address', '$test_date')";
    if ($conn->query($sql) === TRUE) {
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }


    $sql = "INSERT INTO patient_requests (request_id, patient_id) VALUES (***************, '$id')";
    if ($conn->query($sql) === TRUE) {
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }


    $sql = "INSERT INTO patient_restrictions (request_id, patient_id) VALUES (***************, '$id')";
    if ($conn->query($sql) === TRUE) {
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
    

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
