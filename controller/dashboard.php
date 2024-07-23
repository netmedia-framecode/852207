<?php

require_once("../config/Base.php");
require_once("../config/Auth.php");
require_once("../config/Alert.php");

$tempat_wisata = "SELECT * FROM tempat_wisata";
$view_tempat_wisata = mysqli_query($conn, $tempat_wisata);
$fasilitas = "SELECT * FROM fasilitas";
$view_fasilitas = mysqli_query($conn, $fasilitas);
$maps = "SELECT * FROM maps ORDER BY id_map DESC";
$view_maps = mysqli_query($conn, $maps);
$polygon_maps = "SELECT * FROM polygon_maps JOIN tempat_wisata ON polygon_maps.id_wisata = tempat_wisata.id_wisata";
$view_polygon_maps = mysqli_query($conn, $polygon_maps);