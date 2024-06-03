-- Active: 1711937588478@@127.0.0.1@3306@wisata_mollo_utara
CREATE TABLE auth(
  id INT AUTO_INCREMENT PRIMARY KEY,
  image VARCHAR(50),
  bg VARCHAR(35)
);

CREATE TABLE user_role(
  id_role INT AUTO_INCREMENT PRIMARY KEY,
  role VARCHAR(35)
);

INSERT INTO
  user_role(role)
VALUES
  ('Administrator'),
  ('Owner'),
  ('Member');

CREATE TABLE user_status(
  id_status INT AUTO_INCREMENT PRIMARY KEY,
  status VARCHAR(35)
);

INSERT INTO
  user_status(status)
VALUES
  ('Active'),
  ('No Active');

CREATE TABLE users(
  id_user INT AUTO_INCREMENT PRIMARY KEY,
  id_role INT,
  id_active INT,
  en_user VARCHAR(75),
  token CHAR(6),
  name VARCHAR(100),
  image VARCHAR(100),
  email VARCHAR(75),
  password VARCHAR(100),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_role) REFERENCES user_role(id_role) ON UPDATE NO ACTION ON DELETE NO ACTION,
  FOREIGN KEY (id_active) REFERENCES user_status(id_active) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE user_menu(
  id_menu INT AUTO_INCREMENT PRIMARY KEY,
  menu VARCHAR(50)
);

CREATE TABLE user_sub_menu(
  id_sub_menu INT AUTO_INCREMENT PRIMARY KEY,
  id_menu INT,
  id_active INT,
  title VARCHAR(50),
  url VARCHAR(50),
  icon VARCHAR(50),
  FOREIGN KEY (id_menu) REFERENCES user_menu(id_menu) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_active) REFERENCES user_status(id_active) ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE user_access_menu(
  id_access_menu INT AUTO_INCREMENT PRIMARY KEY,
  id_role INT,
  id_menu INT,
  FOREIGN KEY (id_role) REFERENCES user_role(id_role) ON UPDATE NO ACTION ON DELETE NO ACTION,
  FOREIGN KEY (id_menu) REFERENCES user_menu(id_menu) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE user_access_sub_menu(
  id_access_sub_menu INT AUTO_INCREMENT PRIMARY KEY,
  id_role INT,
  id_sub_menu INT,
  FOREIGN KEY (id_role) REFERENCES user_role(id_role) ON UPDATE NO ACTION ON DELETE NO ACTION,
  FOREIGN KEY (id_sub_menu) REFERENCES user_sub_menu(id_sub_menu) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE fasilitas(
  id_fasilitas INT AUTO_INCREMENT PRIMARY KEY,
  image_fasilitas VARCHAR(75),
  nama_fasilitas VARCHAR(50)
);

CREATE TABLE jenis_wisata(
  id_jenis_wisata INT AUTO_INCREMENT PRIMARY KEY,
  jenis_wisata VARCHAR(50)
);

CREATE TABLE desa(
  id_desa INT AUTO_INCREMENT PRIMARY KEY,
  desa VARCHAR(50)
);

CREATE TABLE tempat_wisata(
  id_wisata INT AUTO_INCREMENT PRIMARY KEY,
  id_jenis_wisata INT,
  id_desa INT,
  image_wisata VARCHAR(100),
  nama_wisata VARCHAR(100),
  deskripsi TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_jenis_wisata) REFERENCES jenis_wisata(id_jenis_wisata) ON UPDATE CASCADE ON DELETE NO ACTION,
  FOREIGN KEY (id_desa) REFERENCES desa(id_desa) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE fasilitas_wisata(
  id_fasilitas_wisata INT AUTO_INCREMENT PRIMARY KEY,
  id_fasilitas INT,
  id_wisata INT,
  FOREIGN KEY (id_fasilitas) REFERENCES fasilitas(id_fasilitas) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (id_wisata) REFERENCES tempat_wisata(id_wisata) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE maps(
  id_map INT AUTO_INCREMENT PRIMARY KEY,
  id_tipe_lokasi INT,
  id_lokasi INT,
  longitude CHAR(20),
  latitude CHAR(20),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_wisata) REFERENCES tempat_wisata(id_wisata) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE polygon_maps(
  id_pmap INT AUTO_INCREMENT PRIMARY KEY,
  id_wisata INT,
  longitude CHAR(20),
  latitude CHAR(20),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_wisata) REFERENCES tempat_wisata(id_wisata) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE galeri(
  id_galeri INT AUTO_INCREMENT PRIMARY KEY,
  id_wisata INT,
  image_galeri VARCHAR(75),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_wisata) REFERENCES tempat_wisata(id_wisata) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE kontak (
  id_kontak INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(75),
  email VARCHAR(50),
  phone CHAR(12),
  pesan TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tentang(
  id_tentang INT AUTO_INCREMENT PRIMARY KEY,
  deskripsi TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);