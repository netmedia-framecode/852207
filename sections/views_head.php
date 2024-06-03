<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>
  <?= $name_website ?> <?php if (isset($_SESSION['project_wisata_mollo_utara']['name_page'])) {
                          if (!empty($_SESSION['project_wisata_mollo_utara']['name_page'])) {
                            echo " - " . $_SESSION['project_wisata_mollo_utara']['name_page'];
                          }
                        } ?>
</title>

<!-- Custom fonts for this template-->
<link href="<?= $baseURL ?>assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

<!-- Custom styles for this template-->
<link href="<?= $baseURL ?>assets/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="<?= $baseURL ?>assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<!-- Custom styles for plugin -->
<script src="<?= $baseURL ?>assets/sweetalert/dist/sweetalert2.all.min.js"></script>

<script src="<?= $baseURL; ?>assets/ckeditor/ckeditor.js"></script>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css" integrity="sha512-hoalWLoI8r4UszCkZ5kL8vayOGVae1oxXe/2A4AO6J9+580uKHDO3JdHb7NzwwzK5xr/Fs0W40kiNHxM9vyTtQ==" crossorigin="" />
<script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js" integrity="sha512-BB3hKbKWOc9Ez/TAwyWxNXeoV9c1v6FIeYiBieIWkpLjauysF18NzgR1MBNBXf8/KABdlkX68nAhlwcDFLGPCQ==" crossorigin=""></script>