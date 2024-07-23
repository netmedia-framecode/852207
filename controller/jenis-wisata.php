<?php

require_once("../config/Base.php");
require_once("../config/Auth.php");
require_once("../config/Alert.php");

$jenis_wisata = "SELECT * FROM jenis_wisata ORDER BY id_jenis_wisata DESC";
$view_jenis_wisata = mysqli_query($conn, $jenis_wisata);
if (isset($_POST["add_jenis_wisata"])) {
	$validated_post = array_map(function ($value) use ($conn) {
		return valid($conn, $value);
	}, $_POST);
	if (jenis_wisata($conn, $validated_post, $action = 'insert', $baseURL) > 0) {
		$message = "Data baru berhasil ditambahkan.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: jenis-wisata");
		exit();
	}
}
if (isset($_POST["edit_jenis_wisata"])) {
	$validated_post = array_map(function ($value) use ($conn) {
		return valid($conn, $value);
	}, $_POST);
	if (jenis_wisata($conn, $validated_post, $action = 'update', $baseURL) > 0) {
		$message = "Data yang dipilih berhasil diubah.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: jenis-wisata");
		exit();
	}
}
if (isset($_POST["delete_jenis_wisata"])) {
	$validated_post = array_map(function ($value) use ($conn) {
		return valid($conn, $value);
	}, $_POST);
	if (jenis_wisata($conn, $validated_post, $action = 'delete', $baseURL) > 0) {
		$message = "Data yang dipilih berhasil dihapus.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: jenis-wisata");
		exit();
	}
}
