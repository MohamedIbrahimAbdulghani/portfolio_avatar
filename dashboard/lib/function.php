<?php
require_once "db.php";

// this variable to store errors
$error_message = [];
$success_message ;


// this function to check the input is require or not require
function checkInputRequire($input) {
    if(empty($input)):
        return true;
    else:
        return false;
    endif;
}

// this function to insert user to database use it in register
function addNewUser($name, $email, $password) {
    global $connection_database;
        $sql = "INSERT INTO `user` (`name`, `email`, `password`) VALUES  ('$name', '$email', '$password')";
        $q = mysqli_query($connection_database, $sql);
        $result = mysqli_affected_rows($connection_database);
        if($result):
            return true;
        else:
            return false;
        endif;
}

// this function to select user from database use it in login
function selectUser($email, $password) {
    global $connection_database;
    $sql = "SELECT * FROM `user` WHERE `email` = '$email' AND `password` = '$password' ";
    $q = mysqli_query($connection_database, $sql);
    $result =  mysqli_fetch_assoc($q);
    return $result;
}

