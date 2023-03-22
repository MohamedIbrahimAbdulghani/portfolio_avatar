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
function getUser($email, $password) {
    global $connection_database;
    $sql = "SELECT * FROM `user` WHERE `email` = '$email' AND `password` = '$password' ";
    $q = mysqli_query($connection_database, $sql);
    $result =  mysqli_fetch_assoc($q);
    return $result;
}

// this function to insert data to portfolio
function insertPortfolio($image, $description, $user_id) {
    global $connection_database;
    $sql = "INSERT INTO `portfolio` (`image`, `description`, `user_id`) VALUES ('$image', '$description', '$user_id') ";
    $q = mysqli_query($connection_database, $sql);
    $result = mysqli_affected_rows($connection_database);
    if($result):
        return true;
    else:
        return false;
    endif;
}

// this function to select portfolio from database 
function getPortfolio() {
    global $connection_database;
    $sql = "SELECT * FROM `user_portfolio` ";
    $q = mysqli_query($connection_database, $sql);
    $projects = [];
    while($result =  mysqli_fetch_assoc($q)):
    $projects[] = $result;
    endwhile;
    return $projects;
}

// this function to delete portfolio
function deletePortfolio($projectId) {
    global $connection_database;
    $sql = "DELETE FROM `portfolio` WHERE `id` = '$projectId' ";
    $q = mysqli_query($connection_database, $sql);
    $result = mysqli_affected_rows($connection_database);
    if($result):
        return true;
    else:
        return false;
    endif;
}

