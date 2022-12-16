
<?php
//connect.php file code start

$mydb="
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = sergeysk)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XE)
    )
  )";

  $conn_username = "your user name";
  $conn_password = "your password";

  $opt = [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_NUM,

];

  try{
      $conn = new PDO("oci:dbname=".$mydb, $conn_username, $conn_password, $opt);
  }catch(PDOException $e){
      echo ($e->getMessage());
}

//connect.php file code end
?>