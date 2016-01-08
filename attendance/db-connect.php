<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = 'attendance1';

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

mysqli_select_db($conn, $database) or die( "Unable to select database");