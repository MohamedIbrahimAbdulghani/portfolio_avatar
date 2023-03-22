<?php
session_start();


require_once "lib/function.php";

$res = deletePortfolio($_GET["projectId"]);

if($res):
    header("Location: allportfolio.php");
else:
    header("Location: allportfolio.php");
endif;