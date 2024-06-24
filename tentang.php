<?php require_once("controller/visitor.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Tentang";
require_once("templates/top.php"); ?>

<div class="header-transporent-bg-black">

  <!-- HEADER -->
  <?php require_once("sections/nav.php"); ?>

  <!-- STATIC MEDIA IMAGE -->
  <div class="sm-img-bg-fullscr parallax-section" style="background-image: url(assets/img/about-heading.jpg)" data-stellar-background-ratio="0.5">
    <div class="container sm-content-cont js-height-fullscr">
      <div class="sm-cont-middle">

        <!-- OPACITY container -->
        <div class="opacity-scroll2">

          <!-- LAYER NR. 1 -->

          <h1 class="cd-headline zoom light-72-wide font-white sm-mt-20  sm-mb-20">
            <span>TENTANG</span><br>
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
        <h1><span class="font-light">Wilayah Potensi Wisata di Kecamatan Mollo Utara</span></h1>
        <p class="mb-60">
          <?php
          foreach ($view_tentang as $data_tentang) {
            echo $data_tentang['deskripsi'];
          } ?>
        </p>
      </div>
    </div><!--end of row-->
  </div>
</div>

<?php require_once("templates/bottom.php"); ?>