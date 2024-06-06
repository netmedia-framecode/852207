<?php require_once("controller/visitor.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Tempat Wisata";
require_once("templates/top.php"); ?>

<div class="header-transporent-bg-black">

  <!-- HEADER -->
  <?php require_once("sections/nav.php"); ?>

  <!-- STATIC MEDIA IMAGE -->
  <div class="sm-img-bg-fullscr parallax-section" style="background-image: url(assets/img/heading.jpg)" data-stellar-background-ratio="0.5">
    <div class="container sm-content-cont js-height-fullscr">
      <div class="sm-cont-middle">

        <!-- OPACITY container -->
        <div class="opacity-scroll2">

          <!-- LAYER NR. 1 -->

          <h1 class="cd-headline zoom light-72-wide font-white sm-mt-20  sm-mb-20">
            <span>WISATA</span>
            <span class="cd-words-wrapper waiting">
              <b class="is-visible">KECAMATAN</b>
              <b>MOLLO</b>
              <b>UTARA</b>
            </span>
          </h1>

          <!-- LAYER NR. 2 -->
          <div class="font-white norm-16-wide hide-0-736 sm-mb-60">
            GIS<span class="slash-divider-10">/</span>PARIWISATA<span class="slash-divider-10">/</span>ECONOMY<span class="slash-divider-10">/</span>SUBDISTRICT
          </div>

          <!-- LAYER NR. 3 -->
          <div class="center-0-478">
            <a class="button medium thin hover-dark tp-button white ml-20" href="maps">Maps</a>
          </div>

        </div>

      </div>
    </div>
    <!-- SCROLL ICON -->
    <div class="local-scroll-cont font-white">
      <a href="#tempat-wisata" class="scroll-down smooth-scroll">
        <div class="icon icon-arrows-down"></div>
      </a>
    </div>
  </div>

</div>

<!-- FEATURES 8 -->
<div class="page-section fes4-cont" id="tempat-wisata">
  <div class="container">
    <div class="row">
      <?php foreach ($view_tempat_wisata_detail as $data_tw) { ?>
        <div class="card" style="margin-bottom: 50px;">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="assets/img/wisata/<?= $data_tw['image_wisata'] ?>" style="width: 100%; height: 500px; object-fit: cover;" alt="...">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h2 class="card-title" style="margin-top: 0px;"><?= $data_tw['nama_wisata'] ?></h2>
                <h5 class="card-title" style="margin-top: -15px;"><?= $data_tw['jenis_wisata'] ?></h5>
                <p class="card-text"><?= $data_tw['desa']; ?></p>
                <p class="card-text"><?= $data_tw['deskripsi']; ?></p>
                <h5>Fasilitas :</h5>
                <ul>
                  <?php $id_tw = $data_tw['id_wisata'];
                  $fasilitas_wisata = "SELECT * FROM fasilitas_wisata JOIN fasilitas ON fasilitas_wisata.id_fasilitas=fasilitas.id_fasilitas WHERE fasilitas_wisata.id_wisata='$id_tw'";
                  $view_fasilitas_wisata = mysqli_query($conn, $fasilitas_wisata);
                  if (mysqli_num_rows($view_fasilitas_wisata) > 0) {
                    while ($data_fw = mysqli_fetch_assoc($view_fasilitas_wisata)) { ?>
                      <li>
                        <p><?= $data_fw['nama_fasilitas'] ?></p>
                      </li>
                  <?php }
                  } ?>
                </ul>
              </div>
            </div>
          </div>
        </div>
      <?php } ?>
    </div>
  </div>
</div>

<?php require_once("templates/bottom.php"); ?>