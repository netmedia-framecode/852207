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
                        <?php foreach ($view_tempat_wisata as $data_tw) : ?>
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
                    <?php foreach ($view_polygon_maps as $data) { ?>
                      <ul>
                        <li>
                          <?= $data['nama_wisata'] . " : " . $data['latitude'] . ", " . $data['longitude'] ?><br>
                          <form action="" method="post">
                            <input type="hidden" name="id_pmap" value="<?= $data['id_pmap'] ?>">
                            <button type="submit" name="delete_polygon_tempat_wisata" class="btn btn-danger btn-sm"><i class="bi bi-trash3"></i></button>
                          </form>
                        </li>
                      </ul>
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
        var map = L.map('map').setView([-9.7187444, 124.1151441], 12);
        var tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

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

        // Add polygons to the map with random colors
        for (var i = 0; i < latlngs.length; i++) {
          var color = getRandomColor();
          var polygon = L.polygon(latlngs[i], {
            color: color
          }).addTo(map);
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