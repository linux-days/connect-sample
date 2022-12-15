<?php
$serverName = "localhost";
$connectionOptions = array(
    "Database" => "database",
    "Uid" => "id",
    "PWD" => "password"
);
//Establishes the connection
$conn = sqlsrv_connect($serverName, $connectionOptions);
if($conn) {
   echo "Connection established.<br />";
   $client_info = sqlsrv_client_info($conn);
   foreach( $client_info as $key => $value) {
      echo $key.": ".$value."<br />";
   }
} else {
  echo "Connection could not be established.<br />";
  echo "<PRE>";
  print_r( sqlsrv_errors());
  echo "</PRE>";
}
?>