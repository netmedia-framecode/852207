<?php require_once("controller/visitor.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Kontak";
require_once("templates/top.php"); ?>

<div class="header-transporent-bg-black">

  <!-- HEADER -->
  <?php require_once("sections/nav.php"); ?>

  <!-- STATIC MEDIA IMAGE -->
  <div class="page-title-cont page-title-big grey-light-bg">
    <div class="relative container align-left">
      <div class="row">

        <div class="col-md-8">
          <h1 class="page-title">KONTAK</h1>
          <div class="page-sub-title">
            WISATA KECAMATAN MOLLO UTARA
          </div>
        </div>

        <div class="col-md-4">
          <div class="breadcrumbs">
            <a href="./">Beranda</a><span class="slash-divider">/</span><span class="bread-current">Kontak</span>
          </div>
        </div>

      </div>
    </div>
  </div>

</div>

<!-- FEATURES 7 -->
<div class="page-section">
  <div class="container-fluid">
    <div class="row">

      <div class="col-md-6">
        <div class="row">
          <img src="assets/img/kontak.jpg" alt="">
        </div>
      </div>

      <div class="col-md-6">
        <div class="contact-form-cont">
          <!-- TITLE -->
          <div class="mb-40">
            <h2 class="section-title">KONTAK <span class="bold">KAMI</span></h2>
          </div>

          <!-- CONTACT FORM -->
          <div>
            <form id="contact-form" method="POST">

              <div class="row">
                <div class="col-md-12 mb-30">
                  <input type="text" value="" maxlength="100" class="controled" name="username" id="username" placeholder="Nama" required>
                </div>
              </div>

              <div class="row">
                <div class="col-md-12 mb-30">
                  <input type="email" value="" maxlength="100" class="controled" name="email" id="email" placeholder="Email" required>
                </div>
              </div>

              <div class="row">
                <div class="col-md-12 mb-30">
                  <input type="number" value="" maxlength="12" class="controled" name="phone" id="phone" placeholder="No. Handphone">
                </div>
              </div>

              <div class="row">
                <div class="col-md-12 mb-40">
                  <textarea maxlength="5000" rows="3" class="controled" name="pesan" id="pesan" placeholder="Pesan Kamu" required></textarea>
                </div>
              </div>

              <div class="row">
                <div class="col-md-12 text-center-xxs">
                  <button type="submit" name="add_kontak" class="button medium gray">Kirim Pesan</button>
                </div>
              </div>

            </form>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<?php require_once("templates/bottom.php"); ?>