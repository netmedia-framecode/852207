<?php require_once("controller/visitor.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Maps";
require_once("templates/top.php"); ?>

<div class="header-transporent-bg-black">

  <!-- HEADER -->
  <?php require_once("sections/nav.php"); ?>

  <!-- STATIC MEDIA IMAGE -->
  <div class="sm-img-bg-fullscr parallax-section">
    <div id="map" class="shadow mt-n4" style="width: 100%; height: 140vh;z-index: 0;"></div>
    <script>
      var map = L.map('map').setView([-9.7260034, 124.2259519], 13);
      var tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

      var iconLock = L.icon({
        iconUrl: 'assets/img/placeholder.png',
        iconSize: [38, 40],
      })

      // Define polygon coordinates
      <?php
      $current_id_wisata = null;
      $polygons = [];
      foreach ($view_polygon as $i => $polygon) {
        if ($polygon['id_wisata'] !== $current_id_wisata) {
          if (!is_null($current_id_wisata)) {
            echo "var polygon_$current_id_wisata = L.polygon([\n";
            echo join(",\n", $polygons[$current_id_wisata]);
            echo "\n], {color: getRandomColor()}).addTo(map);\n";
          }
          $current_id_wisata = $polygon['id_wisata'];
          $polygons[$current_id_wisata] = [];
        }
        $polygons[$current_id_wisata][] = "[{$polygon['latitude']}, {$polygon['longitude']}]";
      }
      // Output the last set of polygons
      if (!is_null($current_id_wisata)) {
        echo "var polygon_$current_id_wisata = L.polygon([\n";
        echo join(",\n", $polygons[$current_id_wisata]);
        echo "\n], {color: getRandomColor()}).addTo(map);\n";
      }
      ?>

      // Function to generate a random color
      function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
          color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
      }

      <?php if (mysqli_num_rows($view_maps) > 0) {
        while ($row = mysqli_fetch_assoc($view_maps)) {
          $id_tipe_lokasi = $row['id_tipe_lokasi'];
          $id_lokasi = $row['id_lokasi'];

          if ($id_tipe_lokasi == 1) {
            $lokasi_image = "wisata";
            $lokasi = "SELECT tempat_wisata.id_wisata as id, tempat_wisata.nama_wisata as nama, tempat_wisata.image_wisata as image, tempat_wisata.deskripsi, desa.desa, jenis_wisata.jenis_wisata 
            FROM tempat_wisata 
            JOIN desa ON tempat_wisata.id_desa=desa.id_desa 
            JOIN jenis_wisata ON tempat_wisata.id_jenis_wisata=jenis_wisata.id_jenis_wisata 
            WHERE tempat_wisata.id_wisata=$id_lokasi
          ";
          } else if ($id_tipe_lokasi == 2) {
            $lokasi_image = "fasilitas";
            $lokasi = "SELECT fasilitas.id_fasilitas as id, fasilitas.nama_fasilitas as nama, fasilitas.image_fasilitas as image, NULL as deskripsi, NULL as desa, NULL as jenis_wisata 
            FROM fasilitas
            WHERE fasilitas.id_fasilitas=$id_lokasi
          ";
          }
          $view_lokasi = mysqli_query($conn, $lokasi);
          $data_lokasi = mysqli_fetch_assoc($view_lokasi);
          if ($data_lokasi['jenis_wisata'] == "Wisata Alam") {
            $pin = "pin-wisata-alam.png";
          } else 
          if ($data_lokasi['jenis_wisata'] == "Wisata Religi") {
            $pin = "pin-wisata-religi.png";
          } else 
          if ($data_lokasi['jenis_wisata'] == "Wisata Sejarah") {
            $pin = "pin-wisata-sejarah.png";
          } else {
            $pin = "pin-fasilitas.png";
          }?>
          var customIcon = L.icon({
            iconUrl: 'assets/img/<?= $pin ?>',
            iconSize: [32, 32],
            iconAnchor: [16, 32],
            popupAnchor: [0, -32]
          });

          // Menggunakan ikon khusus dalam L.marker
          L.marker([<?= $row['latitude'] ?>, <?= $row['longitude'] ?>], {
            icon: customIcon
          }).bindPopup(
            "<div>" +
            "<img src='assets/img/<?= $lokasi_image ?>/<?= $data_lokasi['image'] ?>' style='width: 250px; height: 150px; object-fit: cover;' alt=''>" +
            "<h2 style='margin-top: 5px;'><?= $data_lokasi['nama'] ?></h2>" +
            "<p style='margin-top: -5px; font-size: 14px;'><?= $data_lokasi['desa'] ?></p>" +
            "<p style='margin-top: -5px; font-size: 12px;'><?= $data_lokasi['deskripsi'] ?></p>" +
            "<?php if ($id_tipe_lokasi == 1) {$id_tw = $data_lokasi['id']; $fasilitas_wisata = "SELECT * FROM fasilitas_wisata JOIN fasilitas ON fasilitas_wisata.id_fasilitas=fasilitas.id_fasilitas WHERE fasilitas_wisata.id_wisata='$id_tw'"; $view_fasilitas_wisata = mysqli_query($conn, $fasilitas_wisata); if (mysqli_num_rows($view_fasilitas_wisata) > 0) {echo "<h4 style='margin-top: 5px;'>Fasilitas</h4><ul>"; while ($data_fw = mysqli_fetch_assoc($view_fasilitas_wisata)) { ?> <li> <p style='margin-top: -5px; font-size: 12px;'><?= $data_fw['nama_fasilitas'] ?></p> </li> <?php }echo "</ul>";}} ?> </div>"
          ).addTo(map);

      <?php }
      } ?>
    </script>
  </div>

</div>


<?php require_once("templates/bottom.php"); ?>