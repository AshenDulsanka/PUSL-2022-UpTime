<?php

/*
  Rui Santos
  Complete project details at https://RandomNerdTutorials.com/esp32-esp8266-mysql-database-php/
  
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files.
  
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
*/

$servername = "localhost";

// REPLACE with your Database name
$dbname = "id21971797_pusl2022_uptime";
// REPLACE with Database user
$username = "id21971797_uptimesensordata";
// REPLACE with Database user password
$password = "UpTime@lanka234";

// Keep this API Key value to be compatible with the ESP32 code provided in the project page. 
// If you change this value, the ESP32 sketch needs to match
$api_key_value = "tPmAT5Ab3j7F9";

$api_key = $vibration = $temprature = $fuelLevel = $oilPressure = $current = $sound = $gas = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $api_key = test_input($_POST["api_key"]);
    if ($api_key == $api_key_value) {
        $vibration = test_input($_POST["vibration"]);
        $temprature = test_input($_POST["temprature"]);
        $fuelLevel = test_input($_POST["fuelLevel"]);
        $oilPressure = test_input($_POST["oilPressure"]);
        $current = test_input($_POST["current"]);
        $sound = test_input($_POST["sound"]);
        $gas = test_input($_POST["gas"]);

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "INSERT INTO sensordata (UID, vibration, temprature, fuelLevel, oilPressure, current, sound, gas)
        VALUES (1, '" . $vibration . "', '" . $temprature . "', '" . $fuelLevel . "', '" . $oilPressure . "', '" . $current . "', '" . $sound . "', '" . $gas . "')";

        if ($conn->query($sql) === TRUE) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }

        $conn->close();
    } else {
        echo "Wrong API Key provided.";
    }
} else {
    echo "No data posted with HTTP POST.";
}

function test_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
