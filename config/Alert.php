<?php

$messageTypes = ["success", "info", "warning", "danger", "dark"];

if (!isset($_SESSION["project_wisata_mollo_utara"]["users"])) {
  if (isset($_SESSION["project_wisata_mollo_utara"]["time_message"]) && (time() - $_SESSION["project_wisata_mollo_utara"]["time_message"]) > 2) {
    foreach ($messageTypes as $type) {
      if (isset($_SESSION["project_wisata_mollo_utara"]["message_$type"])) {
        unset($_SESSION["project_wisata_mollo_utara"]["message_$type"]);
      }
    }
    unset($_SESSION["project_wisata_mollo_utara"]["time_message"]);
  }
} else if (isset($_SESSION["project_wisata_mollo_utara"]["users"])) {
  if (isset($_SESSION["project_wisata_mollo_utara"]["users"]["time_message"]) && (time() - $_SESSION["project_wisata_mollo_utara"]["users"]["time_message"]) > 2) {
    foreach ($messageTypes as $type) {
      if (isset($_SESSION["project_wisata_mollo_utara"]["users"]["message_$type"])) {
        unset($_SESSION["project_wisata_mollo_utara"]["users"]["message_$type"]);
      }
    }
    unset($_SESSION["project_wisata_mollo_utara"]["users"]["time_message"]);
  }
}
