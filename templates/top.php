<!DOCTYPE html>
<html lang="en">

<head>
  <?php require_once("sections/head.php"); ?>
</head>

<body>
  <?php foreach ($messageTypes as $type) {
    if (isset($_SESSION["project_wisata_mollo_utara"]["message_$type"])) {
      echo "<div class='message-$type' data-message-$type='{$_SESSION["project_wisata_mollo_utara"]["message_$type"]}'></div>";
    }
  } ?>

  <!-- LOADER -->
  <div id="loader-overflow">
    <div id="loader3">Please enable JS</div>
  </div>

  <div id="wrap" class="boxed ">
    <div class="grey-bg">