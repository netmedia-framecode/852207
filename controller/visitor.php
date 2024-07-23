<?php

require_once("config/Base.php");
require_once("config/Alert.php");

$tentang = "SELECT * FROM tentang";
$view_tentang = mysqli_query($conn, $tentang);
$tempat_wisata = "SELECT tempat_wisata.*, jenis_wisata.jenis_wisata, desa.desa 
	FROM tempat_wisata 
	JOIN jenis_wisata ON tempat_wisata.id_jenis_wisata=jenis_wisata.id_jenis_wisata 
	JOIN desa ON tempat_wisata.id_desa=desa.id_desa 
	ORDER BY tempat_wisata.id_wisata DESC LIMIT 9
";
$view_tempat_wisata = mysqli_query($conn, $tempat_wisata);
$fasilitas = "SELECT * FROM fasilitas";
$view_fasilitas = mysqli_query($conn, $fasilitas);
$maps = "SELECT * FROM maps ORDER BY id_map DESC";
$view_maps = mysqli_query($conn, $maps);
$polygon_maps = "SELECT * FROM polygon_maps";
$view_polygon_maps = mysqli_query($conn, $polygon_maps);
$view_polygon = mysqli_query($conn, $polygon_maps);
$galeri = "SELECT * FROM galeri JOIN tempat_wisata ON galeri.id_wisata=tempat_wisata.id_wisata";
$view_galeri = mysqli_query($conn, $galeri);
$tempat_wisata_detail = "SELECT tempat_wisata.*, jenis_wisata.jenis_wisata, desa.desa 
  FROM tempat_wisata 
  JOIN jenis_wisata ON tempat_wisata.id_jenis_wisata=jenis_wisata.id_jenis_wisata 
  JOIN desa ON tempat_wisata.id_desa=desa.id_desa 
  ORDER BY tempat_wisata.id_wisata DESC LIMIT 50
";
$view_tempat_wisata_detail = mysqli_query($conn, $tempat_wisata_detail);
if (isset($_POST["add_kontak"])) {
  $validated_post = array_map(function ($value) use ($conn) {
    return valid($conn, $value);
  }, $_POST);
  if (kontak($conn, $validated_post, $action = 'insert', $pesan = $_POST['pesan']) > 0) {
    $message = "Pesan berhasil dikirim.";
    $message_type = "success";
    alert($message, $message_type);
    header("Location: kontak");
    exit();
  }
}
