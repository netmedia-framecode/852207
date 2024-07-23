<?php if (!isset($_SESSION[""])) {
  session_start();
}
error_reporting(~E_NOTICE & ~E_DEPRECATED);
require_once("Database.php");
require_once("Mail.php");
require_once(__DIR__ . "/../models/sql.php");
require_once(__DIR__ . "/../assets/vendor/autoload.php");
require_once(__DIR__ . "/../controller/Functions.php");

$baseURL = "http://$_SERVER[HTTP_HOST]/apps/tugas/wisata_mollo_utara/";
$hostname = $_SERVER['HTTP_HOST'];
$port = $_SERVER['SERVER_PORT'];
if (strpos($hostname, 'apps.test') !== false && $port == 8080) {
  $baseURL = str_replace('/apps/', '/', $baseURL);
}
$name_website = "Wisata Mollo Utara";

$select_auth = "SELECT * FROM auth";
$views_auth = mysqli_query($conn, $select_auth);
$data_auth = mysqli_fetch_assoc($views_auth);

$baseIP = "180.249.166.96";
$geoJSON = json_decode(file_get_contents("https://ipinfo.io/{$baseIP}/json"));