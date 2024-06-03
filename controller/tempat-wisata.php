<?php

require_once("../config/Base.php");
require_once("../config/Auth.php");
require_once("../config/Alert.php");

$desa = "SELECT * FROM desa ORDER BY id_desa DESC";
$view_desa = mysqli_query($conn, $desa);
$jenis_wisata = "SELECT * FROM jenis_wisata ORDER BY id_jenis_wisata DESC";
$view_jenis_wisata = mysqli_query($conn, $jenis_wisata);
$fasilitas = "SELECT * FROM fasilitas";
$view_fasilitas = mysqli_query($conn, $fasilitas);
$tempat = "SELECT tempat_wisata.*, jenis_wisata.jenis_wisata, desa.desa 
	FROM tempat_wisata 
	JOIN jenis_wisata ON tempat_wisata.id_jenis_wisata=jenis_wisata.id_jenis_wisata 
	JOIN desa ON tempat_wisata.id_desa=desa.id_desa 
	ORDER BY tempat_wisata.id_wisata DESC LIMIT 50
";
$view_tempat_wisata = mysqli_query($conn, $tempat);
if (isset($_POST["add_tempat_wisata"])) {
	// $validated_post = array_map(function ($value) use ($conn) {
	// 	return valid($conn, $value);
	// }, $_POST);
	if (tempat_wisata($conn, $_POST, $action = 'insert', $fasilitas_id = $_POST['id_fasilitas']) > 0) {
		$message = "Tempat wisata baru berhasil ditambahkan.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: tempat-wisata");
		exit();
	}
}
if (isset($_POST["import_wisata"])) {
	$validated_post = array_map(function ($value) use ($conn) {
		return valid($conn, $value);
	}, $_POST);
	if (tempat_wisata($conn, $validated_post, $action = 'import', $fasilitas_id = null) > 0) {
		$message = "Data tempat wisata baru berhasil di import.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: tempat-wisata");
		exit();
	}
}
if (isset($_POST["export_wisata"])) {
	$validated_post = array_map(function ($value) use ($conn) {
		return valid($conn, $value);
	}, $_POST);
	if (tempat_wisata($conn, $validated_post, $action = 'export', $fasilitas_id = null) > 0) {
		$message = "Data tempat wisata berhasil di export.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: tempat-wisata");
		exit();
	}
}
if (isset($_POST["edit_tempat_wisata"])) {
	// $validated_post = array_map(function ($value) use ($conn) {
	// 	return valid($conn, $value);
	// }, $_POST);
	if (tempat_wisata($conn, $_POST, $action = 'update', $fasilitas_id = $_POST['id_fasilitas']) > 0) {
		$message = "Tempat wisata " . $_POST['nama_wisataOld'] . " berhasil diubah.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: tempat-wisata");
		exit();
	}
}
if (isset($_POST["delete_tempat_wisata"])) {
	$validated_post = array_map(function ($value) use ($conn) {
		return valid($conn, $value);
	}, $_POST);
	if (tempat_wisata($conn, $validated_post, $action = 'delete', $fasilitas_id = null) > 0) {
		$message = "Tempat wisata " . $_POST['nama_wisata'] . " berhasil dihapus.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: tempat-wisata");
		exit();
	}
}
