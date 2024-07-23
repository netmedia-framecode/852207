<?php

require_once("../config/Base.php");
require_once("../config/Auth.php");
require_once("../config/Alert.php");

$fasilitas = "SELECT * FROM fasilitas";
$view_fasilitas = mysqli_query($conn, $fasilitas);
if (isset($_POST["add_fasilitas"])) {
  $validated_post = array_map(function ($value) use ($conn) {
    return valid($conn, $value);
  }, $_POST);
  if (fasilitas($conn, $validated_post, $action = 'insert') > 0) {
    $message = "Fasilitas baru berhasil ditambahkan.";
    $message_type = "success";
    alert($message, $message_type);
    header("Location: fasilitas");
    exit();
  }
}
if (isset($_POST["edit_fasilitas"])) {
  $validated_post = array_map(function ($value) use ($conn) {
    return valid($conn, $value);
  }, $_POST);
  if (fasilitas($conn, $validated_post, $action = 'update') > 0) {
    $message = "Fasilitas " . $_POST['nama_fasilitasOld'] . " berhasil diubah.";
    $message_type = "success";
    alert($message, $message_type);
    header("Location: fasilitas");
    exit();
  }
}
if (isset($_POST["delete_fasilitas"])) {
  $validated_post = array_map(function ($value) use ($conn) {
    return valid($conn, $value);
  }, $_POST);
  if (fasilitas($conn, $validated_post, $action = 'delete') > 0) {
    $message = "Fasilitas " . $_POST['nama_fasilitas'] . " berhasil dihapus.";
    $message_type = "success";
    alert($message, $message_type);
    header("Location: fasilitas");
    exit();
  }
}
