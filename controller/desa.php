<?php

require_once("../config/Base.php");
require_once("../config/Auth.php");
require_once("../config/Alert.php");

$desa = "SELECT * FROM desa ORDER BY id_desa DESC";
$view_desa = mysqli_query($conn, $desa);
if (isset($_POST["add_desa"])) {
	$validated_post = array_map(function ($value) use ($conn) {
		return valid($conn, $value);
	}, $_POST);
	if (desa($conn, $validated_post, $action = 'insert', $baseURL) > 0) {
		$message = "Data baru berhasil ditambahkan.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: desa");
		exit();
	}
}
if (isset($_POST["edit_desa"])) {
	$validated_post = array_map(function ($value) use ($conn) {
		return valid($conn, $value);
	}, $_POST);
	if (desa($conn, $validated_post, $action = 'update', $baseURL) > 0) {
		$message = "Data yang dipilih berhasil diubah.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: desa");
		exit();
	}
}
if (isset($_POST["delete_desa"])) {
	$validated_post = array_map(function ($value) use ($conn) {
		return valid($conn, $value);
	}, $_POST);
	if (desa($conn, $validated_post, $action = 'delete', $baseURL) > 0) {
		$message = "Data yang dipilih berhasil dihapus.";
		$message_type = "success";
		alert($message, $message_type);
		header("Location: desa");
		exit();
	}
}
