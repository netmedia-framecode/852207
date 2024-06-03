<header id="nav" class="header header-1 black-header" <?php if ($_SESSION["project_wisata_mollo_utara"]["name_page"] == "Maps" || $_SESSION["project_wisata_mollo_utara"]["name_page"] == "Kontak") {
                                                        echo "style='background-color: #303236;'";
                                                      } ?>>
  <div class="header-wrapper">
    <div class="container-m-30 clearfix">
      <div class="logo-row">

        <!-- LOGO -->
        <div class="logo-container-2">
          <div class="logo-2">
            <a href="./" class="clearfix text-white">
              <?= $name_website ?>
            </a>
          </div>
        </div>
        <!-- BUTTON -->
        <div class="menu-btn-respons-container">
          <button type="button" class="navbar-toggle btn-navbar collapsed" data-toggle="collapse" data-target="#main-menu .navbar-collapse">
            <span aria-hidden="true" class="icon_menu hamb-mob-icon"></span>
          </button>
        </div>
      </div>
    </div>

    <!-- MAIN MENU CONTAINER -->
    <div class="main-menu-container">

      <div class="container-m-30 clearfix">

        <!-- MAIN MENU -->
        <div id="main-menu">
          <div class="navbar navbar-default" role="navigation">

            <!-- MAIN MENU LIST -->
            <nav class="collapse collapsing navbar-collapse right-1024">
              <ul class="nav navbar-nav">

                <!-- MENU ITEM -->
                <li class="<?php if ($_SESSION["project_wisata_mollo_utara"]["name_page"] == "Beranda") {
                                    echo "current";
                                  } ?>">
                  <a href="./">
                    <div class="main-menu-title">Beranda</div>
                  </a>
                </li>

                <!-- MENU ITEM -->
                <li class="<?php if ($_SESSION["project_wisata_mollo_utara"]["name_page"] == "Tentang") {
                                    echo "current";
                                  } ?>">
                  <a href="tentang">
                    <div class="main-menu-title">Tentang</div>
                  </a>
                </li>

                <!-- MEGA MENU ITEM -->
                <li class="<?php if ($_SESSION["project_wisata_mollo_utara"]["name_page"] == "Galeri") {
                                    echo "current";
                                  } ?>">
                  <a href="galeri">
                    <div class="main-menu-title">Galeri</div>
                  </a>
                </li>

                <!-- MEGA MENU ITEM -->
                <li class="<?php if ($_SESSION["project_wisata_mollo_utara"]["name_page"] == "Tempat Wisata") {
                                    echo "current";
                                  } ?>">
                  <a href="tempat-wisata">
                    <div class="main-menu-title">Tempat Wisata</div>
                  </a>
                </li>

                <!-- MENU ITEM -->
                <li class="<?php if ($_SESSION["project_wisata_mollo_utara"]["name_page"] == "Maps") {
                                    echo "current";
                                  } ?>">
                  <a href="maps">
                    <div class="main-menu-title">Maps</div>
                  </a>
                </li>

                <!-- MENU ITEM -->
                <li class="<?php if ($_SESSION["project_wisata_mollo_utara"]["name_page"] == "Kontak") {
                                    echo "current";
                                  } ?>">
                  <a href="kontak">
                    <div class="main-menu-title">Kontak</div>
                  </a>
                </li>

                <!-- MENU ITEM -->
                <li>
                  <a href="auth/">
                    <div class="main-menu-title"><i class="bi bi-box-arrow-in-right" style="font-size: 18px;"></i></div>
                  </a>
                </li>

              </ul>

            </nav>

          </div>
        </div>
        <!-- END main-menu -->

      </div>
      <!-- END container-m-30 -->

    </div>
    <!-- END main-menu-container -->

  </div>
  <!-- END header-wrapper -->

</header>