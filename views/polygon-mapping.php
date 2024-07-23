<?php require_once("../controller/polygon-mapping.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Polygon Mapping";
require_once("../templates/views_top.php"); ?>

<!-- Begin Page Content -->
<div class="container-fluid p-0 m-0">

  <div class="row p-0 mt-n4">
    <div class="col-lg-4 p-0 m-0">
      <div class="card rounded-0 border-0">
        <div class="card-body p-0" style="height: 140vh;">
          <div class="accordion" id="accordionExample" style="height: 140vh; overflow-y: auto;">
            <div class="card">
              <div class="card-header shadow" id="headingOne">
                <h2 class="mb-0">
                  <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Tambah Polygon Tempat Wisata
                  </button>
                </h2>
              </div>

              <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                  <form action="" method="post">
                    <div class="form-group">
                      <label for="id_wisata">Pilih Tempat Wisata</label>
                      <select name="id_wisata" id="id_wisata" class="form-select form-control" required>
                        <?php foreach ($view_tempat as $data_tw) : ?>
                          <option value="<?= $data_tw['id_wisata'] ?>"><?= $data_tw['nama_wisata'] ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="latitude">Latitude</label>
                      <input type="text" name="latitude" class="form-control" id="latitude" minlength="3" required>
                    </div>
                    <div class="form-group">
                      <label for="longitude">Longitude</label>
                      <input type="text" name="longitude" class="form-control" id="longitude" minlength="3" required>
                    </div>
                    <button type="submit" name="add_polygon_tempat_wisata" class="btn btn-primary btn-sm">Tambah Pin</button>
                  </form>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header shadow" id="headingTwo">
                <h2 class="mb-0">
                  <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    List Polygon Tempat Wisata
                  </button>
                </h2>
              </div>
              <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body p-0">
                  <div class="card rounded-0">
                    <?php foreach ($view_tempat_wisata as $data) { ?>
                      <a class="btn btn-link text-left pl-4" data-toggle="collapse" href="#view-polygon<?= $data['id_wisata'] ?>" role="button" aria-expanded="false" aria-controls="view-polygon<?= $data['id_wisata'] ?>">
                        <?= $data['nama_wisata'] ?>
                      </a>
                      <div class="collapse" id="view-polygon<?= $data['id_wisata'] ?>">
                        <div class="card card-body" style="padding-left: 30px;">
                          <?php $id_wisata = $data['id_wisata'];
                          $polygon_maps = "SELECT * FROM polygon_maps WHERE id_wisata='$id_wisata'";
                          $view_polygon_maps = mysqli_query($conn, $polygon_maps);
                          foreach ($view_polygon_maps as $data_polygon) : ?>
                            <div class="row">
                              <div class="col-lg-10">
                                <p class="mt-n3"><?= "Latitude : " . $data_polygon['latitude'] ?></p>
                                <p class="mt-n3"><?= "Longitude : " . $data_polygon['longitude'] ?></p>
                              </div>
                              <div class="col-lg-2">
                                <form action="" method="post" class="mt-n2">
                                  <input type="hidden" name="id_pmap" value="<?= $data_polygon['id_pmap'] ?>">
                                  <button type="submit" name="delete_polygon_tempat_wisata" class="btn btn-danger btn-sm"><i class="bi bi-trash3"></i></button>
                                </form>
                              </div>
                            </div>
                          <?php endforeach; ?>
                        </div>
                      </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-8">
      <div id="map" class="shadow" style="width: 100%; height: 930px; z-index: 0;"></div>

      <script>
        var map = L.map('map').setView([-9.7260034, 124.2259519], 13);

        // get coordinat location
        var latInput = document.querySelector("[name=latitude]");
        var lngInput = document.querySelector("[name=longitude]");
        var curLocation = [-9.7187444, 124.1151441];
        map.attributionControl.setPrefix(false);
        var marker = new L.marker(curLocation, {
          draggable: 'true',
        });
        marker.on('dragend', function(event) {
          var position = marker.getLatLng();
          marker.setLatLng(position, {
            draggable: 'true',
          }).bindPopup(position).update();
          $("#latitude").val(position.lat);
          $("#longitude").val(position.lng);
        });
        map.addLayer(marker);

        map.on("click", function(e) {
          var lat = e.latlng.lat;
          var lng = e.latlng.lng;
          if (!marker) {
            marker = L.marker(e.latlng).addTo(map);
          } else {
            marker.setLatLng(e.latlng);
          }
          latInput.value = lat;
          lngInput.value = lng;
        });

        // Basemaps
        var osm = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          maxZoom: 19,
          attribution: '© OpenStreetMap contributors'
        });
        var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
          maxZoom: 17,
          attribution: '© OpenStreetMap contributors'
        });
        var watercolor = L.tileLayer('https://stamen-tiles-{s}.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.jpg', {
          maxZoom: 16,
          attribution: 'Map tiles by Stamen Design, under CC BY 3.0. Data by OpenStreetMap, under ODbL.'
        });

        // Add the default basemap
        osm.addTo(map);

        // Layer groups for overlays
        var markers = L.layerGroup();
        var polygons = L.layerGroup();

        // Add control layers to the map
        var baseMaps = {
          "OpenStreetMap": osm,
          "Topographic": topo,
          "Watercolor": watercolor
        };

        var overlayMaps = {
          "Markers": markers,
          "Polygons": polygons
        };

        L.control.layers(baseMaps, overlayMaps).addTo(map);

        // Example of adding polygons and markers
        <?php
        $current_id_wisata = null;
        $polygons = [];
        foreach ($view_polygon as $i => $polygon) {
          if ($polygon['id_wisata'] !== $current_id_wisata) {
            if (!is_null($current_id_wisata)) {
              echo "var polygon_$current_id_wisata = L.polygon([\n";
              echo join(",\n", $polygons[$current_id_wisata]);
              echo "\n], {color: getRandomColor()}).addTo(polygons);\n";
            }
            $current_id_wisata = $polygon['id_wisata'];
            $polygons[$current_id_wisata] = [];
          }
          $polygons[$current_id_wisata][] = "[{$polygon['latitude']}, {$polygon['longitude']}]";
        }
        if (!is_null($current_id_wisata)) {
          echo "var polygon_$current_id_wisata = L.polygon([\n";
          echo join(",\n", $polygons[$current_id_wisata]);
          echo "\n], {color: getRandomColor()}).addTo(polygons);\n";
        }
        ?>

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
          WHERE tempat_wisata.id_wisata=$id_lokasi";
            } else if ($id_tipe_lokasi == 2) {
              $lokasi_image = "fasilitas";
              $lokasi = "SELECT fasilitas.nama_fasilitas as nama, fasilitas.image_fasilitas as image, NULL as deskripsi, NULL as desa, NULL as jenis_wisata 
          FROM fasilitas
          WHERE fasilitas.id_fasilitas=$id_lokasi";
            }
            $view_lokasi = mysqli_query($conn, $lokasi);
            $data_lokasi = mysqli_fetch_assoc($view_lokasi);
            if ($data_lokasi['jenis_wisata'] == "Wisata Alam") {
              $pin = "pin-wisata-alam.png";
            } else if ($data_lokasi['jenis_wisata'] == "Wisata Religi") {
              $pin = "pin-wisata-religi.png";
            } else if ($data_lokasi['jenis_wisata'] == "Wisata Sejarah") {
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

            // Using custom icon in L.marker
            L.marker([<?= $row['latitude'] ?>, <?= $row['longitude'] ?>], {
              icon: customIcon
            }).bindPopup(
              "<div>" +
              "<img src='../assets/img/<?= $lokasi_image ?>/<?= $data_lokasi['image'] ?>' style='width: 250px; height: 150px; object-fit: cover;' alt=''>" +
              "<h4 style='margin-top: 5px;'><?= $data_lokasi['nama'] ?></h4>" +
              "<p style='margin-top: -5px; font-size: 14px;'><?= $data_lokasi['desa'] ?></p>" +
              "<p style='margin-top: -5px; font-size: 12px;'><?= $data_lokasi['deskripsi'] ?></p>" +
              "</div>"
            ).addTo(markers);
        <?php }
        } ?>

        // Function to generate a random color
        function getRandomColor() {
          var letters = '0123456789ABCDEF';
          var color = '#';
          for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
          }
          return color;
        }

        // Add polygons to the map with random colors
        for (var i = 0; i < latlngs.length; i++) {
          var color = getRandomColor();
          var polygon = L.polygon(latlngs[i], {
            color: color
          }).addTo(polygons);
          polygon.bindPopup("Polygon " + (i + 1) + "<br>Color: " + color);
        }

        function showMapPin(lat, lng, image, name, description) {
          map.setView([lat, lng], 12);
          var popupContent = "<img src='../assets/img/wisata/" + image + "' class='w-100' style='height: 150px; object-fit: cover;' alt=''><b>" + name + "</b><br>" + description;
          if (marker) {
            marker.setLatLng([lat, lng]).bindPopup(popupContent).openPopup();
          } else {
            marker = L.marker([lat, lng]).addTo(map).bindPopup(popupContent).openPopup();
          }
        }
      </script>

    </div>
  </div>

</div>
<!-- /.container-fluid -->

<?php require_once("../templates/views_bottom.php") ?>