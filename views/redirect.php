<?php
if (!isset($_SESSION["project_wisata_mollo_utara"]["users"])) {
  header("Location: ../auth/");
  exit;
}
