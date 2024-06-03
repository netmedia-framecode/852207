<?php

require_once("../config/Base.php");
require_once("../config/Auth.php");
require_once("../config/Alert.php");

$tempat = "SELECT * FROM tempat_wisata ORDER BY id_wisata DESC LIMIT 50";
$view_tempat_wisata = mysqli_query($conn, $tempat);
$fasilitas = "SELECT * FROM fasilitas ORDER BY id_fasilitas DESC LIMIT 50";
$view_fasilitas = mysqli_query($conn, $fasilitas);
$maps = "SELECT * FROM maps ORDER BY id_map DESC";
$view_maps = mysqli_query($conn, $maps);
if (isset($_POST["add_pin_tempat_wisata"])) {
  $validated_post = array_map(function ($value) use ($conn) {
    return valid($conn, $value);
  }, $_POST);
  if (maps($conn, $validated_post, $action = 'insert') > 0) {
    $message = "Pin wisata berhasil ditambahkan.";
    $message_type = "success";
    alert($message, $message_type);
    header("Location: pemetaan");
    exit();
  }
}
if (isset($_POST["delete_pin_tempat_wisata"])) {
  $validated_post = array_map(function ($value) use ($conn) {
    return valid($conn, $value);
  }, $_POST);
  if (maps($conn, $validated_post, $action = 'delete') > 0) {
    $message = "Pin wisata berhasil dihapus.";
    $message_type = "success";
    alert($message, $message_type);
    header("Location: pemetaan");
    exit();
  }
}
