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
    <th>Patient Name</th>
    <th>Patient Address</th>
    <th>Requested Delivery Date</th>
    <th>Item</th>
  </tr>

  <?php
    $name = $_GET['name'];
    $address = $_GET['address'];
    $test_date = $_GET['test_date'];
    $delivery_date = $_GET['delivery_date'];
    $delivery_time = $_GET['deliver_time'];
    $restrictions = $_GET['restrictions'];
    $supplies = $_GET['supplies'];
    $id = rand();
    
    /*create patient first*/
    $sql = "INSERT INTO patients (patient_id, name, address, test_date, delivery_date) VALUES ('$id', '$name', '$address', '$test_date', ('$delivery_date'))";
    if ($conn->query($sql) === TRUE) {
      echo "\nNew patient created successfully\n";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }

    /*enter all restrictions*/
    if(empty($restrictions)) {
      echo("no supplies requested\n");
    } else {
      $n = count($restrictions);
      for($i=0; $i < $n; $i++) {
        $sql = "INSERT INTO patient_restrictions(patient_id, restriction_id) VALUES ('$id', '$restrictions[$i]')";
        if ($conn->query($sql) === TRUE) {
          echo "\nNew restriction created successfully\n";
        } else {
          echo "Error: " . $sql . "<br>" . $conn->error;
        }
      }
    }
    
    /*enter all supplies*/
    if(empty($supplies)) {
      echo("No supplies requested");
    } else {
      $n = count($supplies);
      for($i=0; $i < $n; $i++) {
        $sql = "INSERT INTO patient_requests(patient_id, item_id) VALUES ('$id', '$supplies[$i]')";
        if ($conn->query($sql) === TRUE) {
          echo "\nNew supply request created successfully\n";
        } else {
          echo "Error: " . $sql . "<br>" . $conn->error;
        }
      }
    }

    /*SELECT for showing all current requests*/
    $sql = "SELECT name, address, delivery_date, item_name
            FROM patients 
            JOIN patient_requests USING (patient_id)
            JOIN inventory_items USING (item_id)
            ORDER BY name, item_name";      
    $result = $conn->query($sql) or die($conn->error);
    while ($row = $result->fetch_assoc())
    {
      echo("<tr><td>".$row["name"]."</td><td>".$row["address"]."</td><td>".$row["delivery_date"]."</td><td>".$row["item_name"]."</td></tr>");
    }
  ?>
</table>
</body>
</html>
