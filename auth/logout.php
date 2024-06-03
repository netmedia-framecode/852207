<?php if (!isset($_SESSION)) {
  session_start();
}
require_once("../controller/auth.php");
if (isset($_SESSION["project_wisata_mollo_utara"])) {
  unset($_SESSION["project_wisata_mollo_utara"]);
  header("Location: ./");
  exit();
}
