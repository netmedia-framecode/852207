<?php require_once("controller/visitor.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Galeri";
require_once("templates/top.php"); ?>

<div class="header-transporent-bg-black">

  <!-- HEADER -->
  <?php require_once("sections/nav.php"); ?>

  <!-- STATIC MEDIA IMAGE -->
  <div class="sm-img-bg-fullscr parallax-section" style="background-image: url(assets/img/galeri-heading.jpg)" data-stellar-background-ratio="0.5">
    <div class="container sm-content-cont js-height-fullscr">
      <div class="sm-cont-middle">

        <!-- OPACITY container -->
        <div class="opacity-scroll2">

          <!-- LAYER NR. 1 -->

          <h1 class="cd-headline zoom light-72-wide font-white sm-mt-20  sm-mb-20">
            <span>GALERI</span><br>
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
      <a href="#galeri" class="scroll-down smooth-scroll">
        <div class="icon icon-arrows-down"></div>
      </a>
    </div>
  </div>

</div>

<!-- FEATURES 8 -->
<div class="page-section fes4-cont" id="galeri">
  <div class="container">
    <div class="row">
      <?php foreach ($view_galeri as $data_galeri) { ?>
        <div class="col-lg-4">
          <div class="card" style="margin-bottom: 50px;">
            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#gambar<?= $data_galeri['id_galeri'] ?>">
              <img src="<?= $data_galeri['image_galeri'] ?>" style="width: 350px;height: 250px;object-fit: cover;" alt="">
            </button>
            <div class="modal fade" id="gambar<?= $data_galeri['id_galeri'] ?>" tabindex="-1" role="dialog" aria-labelledby="gambarModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="gambarModalLabel">Tempat Wisata <?= $data_galeri['nama_wisata'] ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <img src="<?= $data_galeri['image_galeri'] ?>" class="img-fluid w-100 h-100" alt="">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      <?php } ?>
    </div>
  </div>
</div>

<?php require_once("templates/bottom.php"); ?>