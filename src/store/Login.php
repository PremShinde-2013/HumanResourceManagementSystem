<?php

session_start();

// require_once('../common/DBConnection.php');
include '../../src/common/DBConnection.php';

// require_once __DIR__ . '/../common/DBConnection.php';

$dbConnection = new DBConnection();
$result = $dbConnection->getAll('SELECT * FROM admins');

$admin = "";
foreach ($result as $row) {
    $admin = $row;
}

$_SESSION['admin_name'] = $admin['name'];
$_SESSION['admin_password'] = $admin['password'];

if (isset($_POST['login'])) {

    $user_name = trim($_POST['userName']);
    $user_password = trim($_POST['password']);

    if ($user_name == $_SESSION['admin_name'] && $user_password == $_SESSION['admin_password']) {
        header("Location:../../views/admin/dashboard.php");
    } else {
        header("Location:../../index.php?msg=User name or password is invalid");
    }
}

class Login
{

}
?>