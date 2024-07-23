<?php require_once("controller/visitor.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Beranda";
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
            <a class="button medium thin hover-dark tp-button white" href="#about">Lihat Lebih</a>
            <a class="button medium thin hover-dark tp-button white ml-20" href="maps">Maps</a>
          </div>

        </div>

      </div>
    </div>
    <!-- SCROLL ICON -->
    <div class="local-scroll-cont font-white">
      <a href="#about" class="scroll-down smooth-scroll">
        <div class="icon icon-arrows-down"></div>
      </a>
    </div>
  </div>

</div>

<!-- FEATURES 7 -->
<div class="page-section grey-light-bg clearfix" id="about">
  <div class="fes7-img-cont col-md-5">
    <div class="fes7-img" style="background-image: url(assets/img/about.jpg)"></div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-6 fes7-text-cont p-80-cont">
        <h1><span class="font-light">Wilayah Potensi Wisata Alam di Kecamatan Mollo Utara</span></h1>
        <p class="mb-60">
          <?php
          foreach ($view_tentang as $data_tentang) {
            $num_char = 250;
            $text = trim($data_tentang['deskripsi']);
            $text = preg_replace('#</?strong.*?>#is', '', $text);
            $lentext = strlen($text);
            if ($lentext > $num_char) {
              echo substr($text, 0, $num_char) . '...';
            } else if ($lentext <= $num_char) {
              echo substr($text, 0, $num_char);
            }
          } ?>
        </p>
        <div class="center-0-478">
          <a class="button medium thin hover-dark tp-button" href="tentang">Lihat Lebih</a>
        </div>
      </div>
    </div><!--end of row-->
  </div>
</div>

<!-- FEATURES 8 -->
<div class="page-section fes4-cont">
  <div class="container">
    <div class="row">
      <?php foreach ($view_tempat_wisata as $data_tw) { ?>
        <div class="col-lg-4">
          <div class="card" style="margin-bottom: 50px;">
            <div class="row no-gutters">
              <div class="col-md-4">
                <img src="assets/img/wisata/<?= $data_tw['image_wisata'] ?>" style="width: 100%; height: 120px; object-fit: cover;" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h3 class="card-title" style="margin-top: 0px;"><?= $data_tw['nama_wisata'] ?></h3>
                  <p class="card-text"><?= $data_tw['desa']; ?></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      <?php } ?>
      <div class="col-lg-12 text-center">
        <div class="card mb-3">
          <div class="row no-gutters">
            <div class="col-md-12">
              <div class="card-body">
                <a class="button medium thin hover-dark tp-button" href="tempat-wisata" style="margin-top: 20px;">Lihat Lebih</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- CALL TO ACTION  -->
<div class="port-view-more-cont-dark">
  <a class="port-view-more-dark" href="maps"><i class="bi bi-geo-alt-fill"></i> LIHAT MAPS</a>
</div>

<!-- WORK PROCESS 1 -->
<div class="page-section">
  <div class="container fes4-cont">
    <div class="row">

      <div class="col-md-4 ">
        <div class="mb-50">
          <h2 class="section-title">PEMETAAN <span class="bold">WILAYAH</span></h2>
        </div>
        <p class="mb-50 ">Pemetaan Wilayah Potensi Wisata Alam di Kecamatan Mollo
          Utara dengan Menggunakan Sistem Informasi Geografis</p>
      </div>
      <div class="col-md-7 col-lg-offset-1">
        <div class="row">

          <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="fes4-box">
              <div class="fes4-title-cont">
                <div class="fes4-box-icon">
                  <i class="fas fa-torii-gate fa-1x text-gray-300"></i>
                </div>
                <h3><span class="bold">Tempat Wisata</span></h3>
                <h2 style="margin-top: 0px;"><?php if (mysqli_num_rows($view_tempat_wisata) > 0) {
                                                echo mysqli_num_rows($view_tempat_wisata);
                                              } else {
                                                echo 0;
                                              } ?></h2>
              </div>

            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="fes4-box">
              <div class="fes4-title-cont">
                <div class="fes4-box-icon">
                  <i class="fas fa-list-ul fa-1x text-gray-300"></i>
                </div>
                <h3><span class="bold">Fasilitas</span></h3>
                <h2 style="margin-top: 0px;"><?php if (mysqli_num_rows($view_fasilitas) > 0) {
                                                echo mysqli_num_rows($view_fasilitas);
                                              } else {
                                                echo 0;
                                              } ?></h2>
              </div>
            </div>
          </div>

        </div>

        <div class="row">

          <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="fes4-box">
              <div class="fes4-title-cont">
                <div class="fes4-box-icon">
                  <i class="fas fa-map fa-1x text-gray-300"></i>
                </div>
                <h3><span class="bold">Pin Wisata</span></h3>
                <h2 style="margin-top: 0px;"><?php if (mysqli_num_rows($view_maps) > 0) {
                                                echo mysqli_num_rows($view_maps);
                                              } else {
                                                echo 0;
                                              } ?></h2>
              </div>

            </div>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="fes4-box">
              <div class="fes4-title-cont">
                <div class="fes4-box-icon">
                  <i class="fas fa-layer-group fa-1x text-gray-300"></i>
                </div>
                <h3><span class="bold">Data Polygon</span></h3>
                <h2 style="margin-top: 0px;"><?php if (mysqli_num_rows($view_polygon_maps) > 0) {
                                                echo mysqli_num_rows($view_polygon_maps);
                                              } else {
                                                echo 0;
                                              } ?></h2>
              </div>
            </div>
          </div>

        </div>

      </div>
    </div>
  </div>
</div>

<?php require_once("templates/bottom.php"); ?>