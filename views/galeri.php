<?php require_once("../controller/galeri.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Galeri";
require_once("../templates/views_top.php"); ?>

<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><?= $_SESSION["project_wisata_mollo_utara"]["name_page"] ?></h1>
  </div>

  <div class="row">
    <div class="col-lg-4">
      <div class="card shadow">
        <div class="card-header">
          Upload Gambar
        </div>
        <div class="card-body" id="drop-area">
          <form action="" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="id_wisata">Pilih Wisata</label>
              <select name="id_wisata" id="id_wisata" class="form-select form-control" required>
                <?php foreach ($view_tempat_wisata as $data_tempat_wisata) : ?>
                  <option value="<?= $data_tempat_wisata['id_wisata'] ?>"><?= $data_tempat_wisata['nama_wisata'] ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="form-group">
              <label for="images">Drag and Drop here:</label>
              <input type="file" class="form-control-file" id="images" name="images[]" accept="image/jpeg, image/png" multiple required>
            </div>
            <div class="form-group shadow mb-5 bg-dark text-white p-3" style="height: 200px;">
              <div id="fileList"></div>
            </div>
            <button name="add_galeri" class="btn btn-primary">Upload</button>
          </form>
        </div>
      </div>
    </div>
    <div class="col-lg-8">
      <div class="card shadow">
        <div class="card-body p-0">
          <?php
          if (mysqli_num_rows($view_galeri) > 0) {
            $wisata_galeri = "SELECT 
                tempat_wisata.id_wisata, 
                tempat_wisata.nama_wisata, 
                MIN(galeri.id_galeri) as id_galeri, 
                MIN(galeri.image_galeri) as image_galeri
            FROM tempat_wisata 
            JOIN galeri 
            ON galeri.id_wisata = tempat_wisata.id_wisata 
            GROUP BY tempat_wisata.id_wisata, tempat_wisata.nama_wisata;
            ";
            $view_wisata_galeri = mysqli_query($conn, $wisata_galeri);
            foreach ($view_wisata_galeri as $data) {
          ?>
              <h4 class="pl-4 pt-4"><?= $data['nama_wisata'] ?></h4>
              <div class="d-flex flex-wrap justify-content-start p-2">
                <?php
                $id_wisata = $data['id_wisata'];
                $galeri = "SELECT * FROM galeri WHERE id_wisata='$id_wisata' ORDER BY id_galeri DESC LIMIT 50";
                $view_galeri = mysqli_query($conn, $galeri);
                foreach ($view_galeri as $row) {
                ?>
                  <form action="" method="post">
                    <img src="<?= $row['image_galeri'] ?>" class="img-thumbnail m-3" style="width: 210px; height: 200px; object-fit: cover;" alt="">
                    <input type="hidden" name="id_galeri" value="<?= $row['id_galeri'] ?>">
                    <input type="hidden" name="image_galeri" value="<?= $row['image_galeri'] ?>">
                    <button type="submit" name="delete_galeri" class="btn btn-danger btn-sm" style="margin-left: -53px;border-top-right-radius: 0px;border-bottom-right-radius: 0px;"><i class="bi bi-trash3"></i></button>
                  </form>
                <?php } ?>
              </div>
          <?php
            }
          } ?>
        </div>
      </div>
    </div>
  </div>

</div>
<!-- /.container-fluid -->

<script>
  const dropArea = document.querySelector("#drop-area");
  const input = document.querySelector("#images");

  dropArea.addEventListener("dragover", function(e) {
    e.preventDefault();
  });

  dropArea.addEventListener("drop", function(e) {
    e.preventDefault();
    input.files = e.dataTransfer.files;

    var files = input.files,
      filesLength = files.length;
    for (var i = 0; i < filesLength; i++) {
      var file = files[i];
      var fileName = file.name;
      var list = document.createElement("li");
      list.innerHTML = fileName;
      document.querySelector("#fileList").appendChild(list);
    }
  });

  input.addEventListener("change", function(e) {
    var files = e.target.files,
      filesLength = files.length;
    for (var i = 0; i < filesLength; i++) {
      var file = files[i];
      var fileName = file.name;
      var list = document.createElement("li");
      list.innerHTML = fileName;
      document.querySelector("#fileList").appendChild(list);
    }
  });
</script>
<?php require_once("../templates/views_bottom.php") ?>