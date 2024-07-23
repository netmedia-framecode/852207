<?php

require_once("../config/Base.php");
require_once("../config/Auth.php");
require_once("../config/Alert.php");

$maps = "SELECT * FROM maps ORDER BY id_map DESC";
$view_maps = mysqli_query($conn, $maps);
$tempat = "SELECT * FROM tempat_wisata ORDER BY id_wisata DESC LIMIT 50";
$view_tempat = mysqli_query($conn, $tempat);
$tempat_wisata = "SELECT * FROM tempat_wisata ORDER BY id_wisata DESC LIMIT 50";
$view_tempat_wisata = mysqli_query($conn, $tempat_wisata);
$fasilitas = "SELECT * FROM fasilitas ORDER BY id_fasilitas DESC LIMIT 50";
$view_fasilitas = mysqli_query($conn, $fasilitas);
$polygon_maps = "SELECT * FROM polygon_maps JOIN tempat_wisata ON polygon_maps.id_wisata = tempat_wisata.id_wisata";
$view_polygon = mysqli_query($conn, $polygon_maps);
if (isset($_POST["add_polygon_tempat_wisata"])) {
  $validated_post = array_map(function ($value) use ($conn) {
    return valid($conn, $value);
  }, $_POST);
  if (polygon($conn, $validated_post, $action = 'insert') > 0) {
    $message = "Polygon wisata berhasil ditambahkan.";
    $message_type = "success";
    alert($message, $message_type);
    header("Location: polygon-mapping");
    exit();
  }
}
if (isset($_POST["delete_polygon_tempat_wisata"])) {
  $validated_post = array_map(function ($value) use ($conn) {
    return valid($conn, $value);
  }, $_POST);
  if (polygon($conn, $validated_post, $action = 'delete') > 0) {
    $message = "Polygon wisata berhasil dihapus.";
    $message_type = "success";
    alert($message, $message_type);
    header("Location: polygon-mapping");
    exit();
  }
}
