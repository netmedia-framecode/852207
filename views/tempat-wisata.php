<?php require_once("../controller/tempat-wisata.php");
$_SESSION["project_wisata_mollo_utara"]["name_page"] = "Tempat Wisata";
require_once("../templates/views_top.php"); ?>

<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><?= $_SESSION["project_wisata_mollo_utara"]["name_page"] ?></h1>
    <div class="col text-right">
      <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#tambah"><i class="bi bi-plus-lg"></i> Tambah</a>
      <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-toggle="modal" data-target="#import"><i class="bi bi-file-earmark-arrow-up-fill"></i> Import</a>
      <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm" data-toggle="modal" data-target="#export"><i class="bi bi-file-earmark-arrow-down-fill"></i> Export</a>
    </div>
  </div>

  <div class="card shadow mb-4 border-0">
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered text-dark" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th class="text-center">Gambar</th>
              <th class="text-center">Nama Wisata</th>
              <th class="text-center">Desa</th>
              <th class="text-center">Jenis Wisata</th>
              <th class="text-center">Deskripsi</th>
              <th class="text-center">Fasilitas</th>
              <th class="text-center" style="width: 200px;">Aksi</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th class="text-center">Gambar</th>
              <th class="text-center">Nama Wisata</th>
              <th class="text-center">Desa</th>
              <th class="text-center">Jenis Wisata</th>
              <th class="text-center">Deskripsi</th>
              <th class="text-center">Fasilitas</th>
              <th class="text-center">Aksi</th>
            </tr>
          </tfoot>
          <tbody>
            <?php foreach ($view_tempat_wisata as $data) { ?>
              <tr>
                <td>
                  <button type="button" class="btn btn-link" data-toggle="modal" data-target="#gambar<?= $data['id_wisata'] ?>"><img src="../assets/img/wisata/<?= $data['image_wisata'] ?>" style="width: 250px;height: 150px;object-fit: cover;" alt=""></button>
                  <div class="modal fade" id="gambar<?= $data['id_wisata'] ?>" tabindex="-1" role="dialog" aria-labelledby="gambarModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="gambarModalLabel"></h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <img src="../assets/img/wisata/<?= $data['image_wisata'] ?>" class="img-fluid w-100 h-100" alt="">
                        </div>
                      </div>
                    </div>
                  </div>
                </td>
                <td><?= $data['nama_wisata'] ?></td>
                <td><?= $data['desa'] ?></td>
                <td><?= $data['jenis_wisata'] ?></td>
                <td><?= $data['deskripsi'] ?></td>
                <td>
                  <span class="badge bg-success text-white" style="cursor: pointer;" data-toggle="modal" data-target="#view-fasilitas<?= $data['id_wisata'] ?>"><i class="bi bi-eye"></i> Fasilitas</span>
                  <div class="modal fade" id="view-fasilitas<?= $data['id_wisata'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header border-bottom-0 shadow">
                          <h5 class="modal-title" id="exampleModalLabel">Fasilitas <?= $data['nama_wisata'] ?></h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <h6>List Fasilitas</h6>
                          <?php $id_wisata = valid($conn, $data['id_wisata']);
                          $fasilitas_wisata = "SELECT * FROM fasilitas_wisata JOIN fasilitas ON fasilitas_wisata.id_fasilitas=fasilitas.id_fasilitas WHERE fasilitas_wisata.id_wisata='$id_wisata'";
                          $view_fasilitas_wisata = mysqli_query($conn, $fasilitas_wisata);
                          foreach ($view_fasilitas_wisata as $data_fasilitas_wisata) { ?>
                            <ul>
                              <li><?= $data_fasilitas_wisata['nama_fasilitas'] ?></li>
                            </ul>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                  </div>
                </td>
                <td class="text-center">
                  <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#ubah<?= $data['id_wisata'] ?>">
                    <i class="bi bi-pencil-square"></i> Ubah
                  </button>
                  <div class="modal fade" id="ubah<?= $data['id_wisata'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header border-bottom-0 shadow">
                          <h5 class="modal-title" id="exampleModalLabel">Ubah <?= $data['nama_wisata'] ?></h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <form action="" method="post" enctype="multipart/form-data">
                          <input type="hidden" name="id_wisata" value="<?= $data['id_wisata'] ?>">
                          <input type="hidden" name="nama_wisataOld" value="<?= $data['nama_wisata'] ?>">
                          <input type="hidden" name="image_wisataOld" value="<?= $data['image_wisata'] ?>">
                          <div class="modal-body text-left">
                            <div class="form-group">
                              <label for="image_wisata">Gambar Tempat Wisata</label>
                              <input type="file" name="image_wisata" class="form-control" id="image_wisata" accept="image/jpeg, image/png">
                            </div>
                            <div class="form-group">
                              <label for="nama_wisata">Nama Wisata</label>
                              <input type="text" name="nama_wisata" value="<?= $data['nama_wisata'] ?>" class="form-control" id="nama_wisata" minlength="3" required>
                            </div>
                            <div class="form-group">
                              <label for="">Deskripsi</label>
                              <textarea name="deskripsi" class="form-control" id="" rows="3"><?= $data['deskripsi'] ?></textarea>
                            </div>
                            <div class="form-group">
                              <label for="id_desa">Desa</label>
                              <select name="id_desa" class="form-control" id="id_desa" required>
                                <option value="" selected>Pilih Desa</option>
                                <?php $id_desa = $data['id_desa'];
                                foreach ($view_desa as $data_d) {
                                  $selected = ($data_d['id_desa'] == $id_desa) ? 'selected' : ''; ?>
                                  <option value="<?= $data_d['id_desa'] ?>" <?= $selected ?>><?= $data_d['desa'] ?></option>
                                <?php } ?>
                              </select>
                            </div>
                            <div class="form-group">
                              <label for="id_jenis_wisata">Jenis Wisata</label>
                              <select name="id_jenis_wisata" class="form-control" id="id_jenis_wisata" required>
                                <option value="" selected>Pilih Jenis Wisata</option>
                                <?php $id_jenis_wisata = $data['id_jenis_wisata'];
                                foreach ($view_jenis_wisata as $data_jw) {
                                  $selected = ($data_jw['id_jenis_wisata'] == $id_jenis_wisata) ? 'selected' : ''; ?>
                                  <option value="<?= $data_jw['id_jenis_wisata'] ?>" <?= $selected ?>><?= $data_jw['jenis_wisata'] ?></option>
                                <?php } ?>
                              </select>
                            </div>
                            <h6>Pilih Fasilitas</h6>
                            <?php foreach ($view_fasilitas as $data_fasilitas) { ?>
                              <div class="form-check">
                                <input name="id_fasilitas[]" class="form-check-input" type="checkbox" value="<?= $data_fasilitas['id_fasilitas'] ?>" id="fasilitas<?= $data['id_wisata'] . $data_fasilitas['id_fasilitas'] ?>">
                                <label class="form-check-label" for="fasilitas<?= $data['id_wisata'] . $data_fasilitas['id_fasilitas'] ?>">
                                  <?= $data_fasilitas['nama_fasilitas'] ?>
                                </label>
                              </div>
                            <?php } ?>
                          </div>
                          <div class="modal-footer justify-content-center border-top-0">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Batal</button>
                            <button type="submit" name="edit_tempat_wisata" class="btn btn-warning btn-sm">Ubah</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#hapus<?= $data['id_wisata'] ?>">
                    <i class="bi bi-trash3"></i> Hapus
                  </button>
                  <div class="modal fade" id="hapus<?= $data['id_wisata'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header border-bottom-0 shadow">
                          <h5 class="modal-title" id="exampleModalLabel">Hapus <?= $data['nama_wisata'] ?></h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <form action="" method="post">
                          <input type="hidden" name="id_wisata" value="<?= $data['id_wisata'] ?>">
                          <input type="hidden" name="nama_wisata" value="<?= $data['nama_wisata'] ?>">
                          <input type="hidden" name="image_wisata" value="<?= $data['image_wisata'] ?>">
                          <div class="modal-body">
                            <p>Jika anda yakin ingin menghapus data ini, klik Hapus!</p>
                          </div>
                          <div class="modal-footer justify-content-center border-top-0">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Batal</button>
                            <button type="submit" name="delete_tempat_wisata" class="btn btn-danger btn-sm">hapus</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </td>
              </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <div class="modal fade" id="tambah" tabindex="-1" aria-labelledby="tambahLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header border-bottom-0 shadow">
          <h5 class="modal-title" id="tambahLabel">Tambah Wisata</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form action="" method="post" enctype="multipart/form-data">
          <div class="modal-body">
            <div class="form-group">
              <label for="image_wisata">Gambar Tempat Wisata</label>
              <input type="file" name="image_wisata" class="form-control" id="image_wisata" accept="image/jpeg, image/png" required>
            </div>
            <div class="form-group">
              <label for="nama_wisata">Nama Wisata</label>
              <input type="text" name="nama_wisata" class="form-control" id="nama_wisata" minlength="3" required>
            </div>
            <div class="form-group">
              <label for="">Deskripsi</label>
              <textarea name="deskripsi" class="form-control" id="" rows="3"></textarea>
            </div>
            <div class="form-group">
              <label for="id_desa">Desa</label>
              <select name="id_desa" class="form-control" id="id_desa" required>
                <option value="" selected>Pilih Desa</option>
                <?php foreach ($view_desa as $data_d) { ?>
                  <option value="<?= $data_d['id_desa'] ?>"><?= $data_d['desa'] ?></option>
                <?php } ?>
              </select>
            </div>
            <div class="form-group">
              <label for="id_jenis_wisata">Jenis Wisata</label>
              <select name="id_jenis_wisata" class="form-control" id="id_jenis_wisata" required>
                <option value="" selected>Pilih Jenis Wisata</option>
                <?php foreach ($view_jenis_wisata as $data_jw) { ?>
                  <option value="<?= $data_jw['id_jenis_wisata'] ?>"><?= $data_jw['jenis_wisata'] ?></option>
                <?php } ?>
              </select>
            </div>
            <h6>Pilih Fasilitas</h6>
            <?php foreach ($view_fasilitas as $data_fasilitas) { ?>
              <div class="form-check">
                <input name="id_fasilitas[]" class="form-check-input" type="checkbox" value="<?= $data_fasilitas['id_fasilitas'] ?>" id="fasilitas<?= $data['id_wisata'] . $data_fasilitas['id_fasilitas'] ?>">
                <label class="form-check-label" for="fasilitas<?= $data['id_wisata'] . $data_fasilitas['id_fasilitas'] ?>">
                  <?= $data_fasilitas['nama_fasilitas'] ?>
                </label>
              </div>
            <?php } ?>
          </div>
          <div class="modal-footer justify-content-center border-top-0">
            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Batal</button>
            <button type="submit" name="add_tempat_wisata" class="btn btn-primary btn-sm">Tambah</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="modal fade" id="import" tabindex="-1" aria-labelledby="importLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header border-bottom-0 shadow">
          <h5 class="modal-title" id="importLabel">Import Wisata</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form action="" method="post" enctype="multipart/form-data">
          <div class="modal-body">
            <div class="form-group">
              <label for="file_wisata">File Excel</label>
              <input type="file" name="file_wisata" class="form-control" id="file_wisata" accept="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" required>
            </div>
          </div>
          <div class="modal-footer justify-content-center border-top-0">
            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Batal</button>
            <button type="submit" name="import_wisata" class="btn btn-primary btn-sm">Import</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="modal fade" id="export" tabindex="-1" aria-labelledby="exportLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header border-bottom-0 shadow">
          <h5 class="modal-title" id="exportLabel">Export Wisata</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form action="" method="post" enctype="multipart/form-data">
          <div class="modal-body">
            <div class="form-group">
              <label for="format_file">Format</label>
              <select name="format_file" id="format_file" class="form-select form-control" required>
                <option selected value="">Pilih Format</option>
                <option value="pdf">PDF</option>
                <option value="excel">Excel</option>
              </select>
            </div>
          </div>
          <div class="modal-footer justify-content-center border-top-0">
            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Batal</button>
            <button type="submit" name="export_wisata" class="btn btn-primary btn-sm">Export</button>
          </div>
        </form>
      </div>
    </div>
  </div>

</div>
<!-- /.container-fluid -->

<?php require_once("../templates/views_bottom.php") ?>