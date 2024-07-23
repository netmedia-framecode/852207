<?php require_once("../controller/pemetaan.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Pemetaan";
require_once("../templates/views_top.php"); ?>

<!-- Begin Page Content -->
<div class="container-fluid p-0 m-0">

  <div class="row p-0 mt-n4">
    <div class="col-lg-3 p-0 m-0">
      <div class="card rounded-0 border-0">
        <div class="card-body p-0" style="height: 140vh;">
          <div class="accordion" id="accordionExample" style="height: 140vh; overflow-y: auto;">
            <div class="card">
              <div class="card-header shadow" id="headingOne">
                <h2 class="mb-0">
                  <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Tambah Pin Tempat Wisata
                  </button>
                </h2>
              </div>

              <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                  <form action="" method="post">
                    <div class="form-group">
                      <label for="id_tipe_lokasi">Tipe Lokasi</label>
                      <select name="id_tipe_lokasi" id="id_tipe_lokasi" class="form-select form-control" required>
                        <option value="" selected>Pilih Tipe Lokasi</option>
                        <option value="1">Tempat Wisata</option>
                        <option value="2">Fasilitas</option>
                      </select>
                    </div>
                    <div class="form-group" id="wisata_form" style="display:none;">
                      <label for="id_wisata">Pilih Tempat Wisata</label>
                      <select name="id_wisata" id="id_wisata" class="form-select form-control" required>
                        <?php foreach ($view_tempat_wisata as $data_tw) : ?>
                          <option value="<?= $data_tw['id_wisata'] ?>"><?= $data_tw['nama_wisata'] ?></option>
                        <?php endforeach; ?>
                      </select>
                    </div>
                    <div class="form-group" id="fasilitas_form" style="display:none;">
                      <label for="id_fasilitas">Pilih Fasilitas</label>
                      <select name="id_fasilitas" id="id_fasilitas" class="form-select form-control" required>
                        <?php foreach ($view_fasilitas as $data_f) : ?>
                          <option value="<?= $data_f['id_fasilitas'] ?>"><?= $data_f['nama_fasilitas'] ?></option>
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
                    <button type="submit" name="add_pin_tempat_wisata" class="btn btn-primary btn-sm">Tambah Pin</button>
                  </form>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header shadow" id="headingTwo">
                <h2 class="mb-0">
                  <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    List Pin Tempat Wisata
                  </button>
                </h2>
              </div>
              <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body p-0">
                  <?php foreach ($view_maps as $data) {
                    $id_tipe_lokasi = $data['id_tipe_lokasi'];
                    $id_lokasi = $data['id_lokasi'];
                    $path = "";

                    if ($id_tipe_lokasi == 1) {
                      $lokasi = "SELECT tempat_wisata.nama_wisata as nama, tempat_wisata.image_wisata as image, tempat_wisata.*, desa.desa 
                        FROM tempat_wisata 
                        JOIN desa ON tempat_wisata.id_desa=desa.id_desa 
                        WHERE tempat_wisata.id_wisata=$id_lokasi
                      ";
                      $path = "wisata";
                    } else if ($id_tipe_lokasi == 2) {
                      $lokasi = "SELECT fasilitas.nama_fasilitas as nama, fasilitas.image_fasilitas as image, NULL as desa 
                        FROM fasilitas 
                        WHERE fasilitas.id_fasilitas=$id_lokasi
                      ";
                      $path = "fasilitas";
                    }
                    $view_lokasi = mysqli_query($conn, $lokasi);
                    $data_lokasi = mysqli_fetch_assoc($view_lokasi);
                  ?>
                    <div class="card rounded-0">
                      <img src="../assets/img/<?= $path . "/" . $data_lokasi['image'] ?>" class="w-100" style="height: 150px; object-fit: cover;" alt="">
                      <div class="card-body">
                        <h5 class="card-title"><?= $data_lokasi['nama'] ?></h5>
                        <p class="card-text"><?= $data_lokasi['desa'] ?></p>
                        <p class="card-text"><small class="text-muted">Terakhir diperbarui <?php $updated_at = date_create($data["updated_at"]);
                                                                                            echo date_format($updated_at, "d M Y h:i a"); ?></small></p>
                        <form action="" method="post">
                          <input type="hidden" name="id_map" value="<?= $data['id_map'] ?>">
                          <button type="submit" name="delete_pin_tempat_wisata" class="btn btn-danger btn-sm"><i class="bi bi-trash3"></i></button>
                          <button type="button" onclick="showMapPin(<?= $data['latitude'] ?>, <?= $data['longitude'] ?>, '<?= $data_lokasi['image'] ?>', '<?= $data_lokasi['nama'] ?>', '<?= $data_lokasi['desa'] ?>')" class="btn btn-success btn-sm"><i class="bi bi-geo-alt"></i> Lokasi</button>
                        </form>
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
    <div class="col-lg-9">
      <div id="map" class="shadow" style="width: 100%; height: 930px;z-index: 0;"></div>

      <script>
        var map = L.map('map').setView([-9.7260034, 124.2259519], 13);
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

        function showMapPin(lat, lng, image, name, description) {
          map.setView([lat, lng], 12);
          var popupContent = "<img src='../assets/img/wisata/" + image + "' style='width: 250px; height: 150px; object-fit: cover;' alt=''><br><h5>" + name + "</h5><br>" + description;
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

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const tipeLokasiSelect = document.getElementById('id_tipe_lokasi');
    const wisataForm = document.getElementById('wisata_form');
    const fasilitasForm = document.getElementById('fasilitas_form');

    function toggleForms() {
      const selectedValue = tipeLokasiSelect.value;
      if (selectedValue == "1") {
        wisataForm.style.display = 'block';
        fasilitasForm.style.display = 'none';
      } else if (selectedValue == "2") {
        wisataForm.style.display = 'none';
        fasilitasForm.style.display = 'block';
      } else {
        wisataForm.style.display = 'none';
        fasilitasForm.style.display = 'none';
      }
    }

    // Initial call to set the correct form visibility based on the default selection
    toggleForms();

    // Event listener for change in dropdown
    tipeLokasiSelect.addEventListener('change', toggleForms);
  });
</script>
<?php require_once("../templates/views_bottom.php") ?>