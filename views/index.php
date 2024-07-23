<?php require_once("../controller/dashboard.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "";
require_once("../templates/views_top.php"); ?>

<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
  </div>

  <?php if ($id_role <= 2) { ?>
    <!-- Content Row -->
    <div class="row">

      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                  Tempat Wisata</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800"><?= mysqli_num_rows($view_tempat_wisata) ?></div>
              </div>
              <div class="col-auto">
                <i class="fas fa-torii-gate fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                  Fasilitas</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800"><?= mysqli_num_rows($view_fasilitas) ?></div>
              </div>
              <div class="col-auto">
                <i class="fas fa-list-ul fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Pin Tempat Wisata
                </div>
                <div class="h5 mb-0 font-weight-bold text-gray-800"><?= mysqli_num_rows($view_maps) ?></div>
              </div>
              <div class="col-auto">
                <i class="fas fa-map fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                  Polygon Tempat Wisata</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800"><?= mysqli_num_rows($view_polygon_maps) ?></div>
              </div>
              <div class="col-auto">
                <i class="fas fa-layer-group fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    <!-- Content Row -->

    <!-- Content Row -->
    <div class="row">
      <div class="col-lg-12 mb-4">
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Maps</h6>
          </div>
          <div class="card-body">
            <div id="map" class="shadow mt-n4" style="width: 100%; height: 140vh;z-index: 0;"></div>
            <script>
              var map = L.map('map').setView([-9.7260034, 124.2259519], 13);
              var tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

              var iconLock = L.icon({
                iconUrl: '../assets/img/placeholder.png',
                iconSize: [38, 40],
              })

              // Define polygon coordinates
              <?php
              $current_id_wisata = null;
              $polygons = [];
              foreach ($view_polygon_maps as $i => $polygon) {
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
                    $lokasi = "SELECT tempat_wisata.nama_wisata as nama, tempat_wisata.image_wisata as image, tempat_wisata.deskripsi, desa.desa, jenis_wisata.jenis_wisata 
                      FROM tempat_wisata 
                      JOIN desa ON tempat_wisata.id_desa=desa.id_desa 
                      JOIN jenis_wisata ON tempat_wisata.id_jenis_wisata=jenis_wisata.id_jenis_wisata 
                      WHERE tempat_wisata.id_wisata=$id_lokasi
                    ";
                  } else if ($id_tipe_lokasi == 2) {
                    $lokasi_image = "fasilitas";
                    $lokasi = "SELECT fasilitas.nama_fasilitas as nama, fasilitas.image_fasilitas as image, NULL as deskripsi, NULL as desa, NULL as jenis_wisata 
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
                  } ?>
                  var customIcon = L.icon({
                    iconUrl: '../assets/img/<?= $pin ?>',
                    iconSize: [32, 32],
                    iconAnchor: [16, 32],
                    popupAnchor: [0, -32]
                  });

                  // Menggunakan ikon khusus dalam L.marker
                  L.marker([<?= $row['latitude'] ?>, <?= $row['longitude'] ?>], {
                    icon: customIcon
                  }).bindPopup(
                    "<div>" +
                    "<img src='../assets/img/<?= $lokasi_image ?>/<?= $data_lokasi['image'] ?>' style='width: 250px; height: 150px; object-fit: cover;' alt=''>" +
                    "<h4 style='margin-top: 5px;'><?= $data_lokasi['nama'] ?></h4>" +
                    "<p style='margin-top: -5px; font-size: 14px;'><?= $data_lokasi['desa'] ?></p>" +
                    "<p style='margin-top: -5px; font-size: 12px;'><?= $data_lokasi['deskripsi'] ?></p>" +
                    "</div>"
                  ).addTo(map);

              <?php }
              } ?>
            </script>
          </div>
        </div>
      </div>
    </div>
  <?php } ?>

</div>
<!-- /.container-fluid -->

<?php require_once("../templates/views_bottom.php") ?>