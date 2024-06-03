<!-- FOOTER 2 BLACK -->
<footer id="footer3" class="page-section pb-50 footer2-black bg-img2">
  <div class="container">
    <div class="footer-2-copy-cont clearfix">
      <!-- Social Links -->
      <div class="footer-2-soc-a right">
        <a href="" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
        <a href="" title="Instagram" target="_blank"><i class="fa fa-instagram"></i></a>
        <a href="" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a>
      </div>

      <!-- Copyright -->
      <div class="left">
        <p class="footer-2-copy">Copyright &copy; <a href="https://wasd.netmedia-framecode.com" class="text-decoration-none">WASD Netmedia Framecode</a> <?= date('Y') ?> | Develop by Redy Alexander T Lelan</p>
      </div>
    </div>
  </div>
</footer>

<!-- BACK TO TOP -->
<p id="back-top">
  <a href="#top" title="Back to Top"><span class="icon icon-arrows-up"></span></a>
</p>

</div><!-- End BG -->
</div><!-- End wrap -->

<!-- JS begin -->

<!-- jQuery  -->
<script src="<?= $baseURL ?>assets/js/jquery-1.11.2.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<?= $baseURL ?>assets/js/bootstrap.min.js"></script>

<!-- MAGNIFIC POPUP -->
<script src='<?= $baseURL ?>assets/js/jquery.magnific-popup.min.js'></script>

<!-- PORTFOLIO SCRIPTS -->
<script src="<?= $baseURL ?>assets/js/isotope.pkgd.min.js"></script>
<script src="<?= $baseURL ?>assets/js/imagesloaded.pkgd.min.js"></script>
<script src="<?= $baseURL ?>assets/js/masonry.pkgd.min.js"></script>

<!-- COUNTER -->
<script src="<?= $baseURL ?>assets/js/jquery.countTo.js"></script>

<!-- APPEAR -->
<script src="<?= $baseURL ?>assets/js/jquery.appear.js"></script>

<!-- OWL CAROUSEL -->
<script src="<?= $baseURL ?>assets/js/owl.carousel.min.js"></script>

<!-- PARALLAX -->
<script src="<?= $baseURL ?>assets/js/jquery.stellar.min.js"></script>

<!-- TEXT ROTATOR -->
<script src="<?= $baseURL ?>assets/js/text-rotator.js"></script>

<!-- MAIN SCRIPT -->
<script src="<?= $baseURL ?>assets/js/main.js"></script>

<script>
const showMessage = (type, title, message) => {
  if (message) {
    Swal.fire({
      icon: type,
      title: title,
      text: message,
    });
  }
};

showMessage("success", "Berhasil Terkirim", $(".message-success").data("message-success"));
showMessage("info", "For your information", $(".message-info").data("message-info"));
showMessage("warning", "Peringatan!!", $(".message-warning").data("message-warning"));
showMessage("error", "Kesalahan", $(".message-danger").data("message-danger"));
</script>

<!-- JS end -->