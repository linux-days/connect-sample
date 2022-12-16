<?php
    $serverName = "sqlserver.example.com";
    $database   = "myDbName";
    $uid        = 'sqlserver_username';
    $pwd        = 'password';

    try {
        $conn = new PDO(
            "sqlsrv:server=$serverName;Database=$database",
            $uid,
            $pwd,
            array(
                //PDO::ATTR_PERSISTENT => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
            )
        );
        echo "<p>Connected to SQL Server</p>\n";
    }
    catch(PDOException $e) {
        die("Error connecting to SQL Server: " . $e->getMessage());
    }

    