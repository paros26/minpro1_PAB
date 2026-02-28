# minpro1_PAB

# MUHAMMAD FARROS ANAND | 2409116085

# MINI PROJECT 1

#  Aplikasi Penjualan LPG

##  Deskripsi Aplikasi

Aplikasi Penjualan LPG adalah aplikasi mobile berbasis Flutter yang digunakan untuk membantu proses pencatatan penjualan gas LPG secara sederhana tanpa menggunakan database.

Aplikasi ini terinspirasi dari sistem distribusi LPG seperti pada aplikasi Pertamina, khususnya dalam proses validasi pelanggan menggunakan NIK sebelum melakukan transaksi pembelian.

Aplikasi ini memungkinkan pengguna untuk melakukan pengelolaan data pelanggan dan transaksi penjualan LPG secara efisien dalam satu aplikasi.

---

## Fitur Aplikasi

###  Login

<img width="1919" height="912" alt="image" src="https://github.com/user-attachments/assets/085af6bb-8832-43d1-9f7b-0dfbd015fb84" />



### Home Page

<img width="1919" height="909" alt="image" src="https://github.com/user-attachments/assets/11665087-015f-443b-9fa7-3fe82896bcc3" />


###  Manajemen Pelanggan (Create)

<img width="1919" height="910" alt="image" src="https://github.com/user-attachments/assets/4ac18573-aef7-4c6f-9825-dc6f859f5c55" />

* Data yang diinput:

  * NIK
  * Nama
  * Alamat
  * Jenis pelanggan (Rumah Tangga / Usaha)

###  Validasi NIK

<img width="1918" height="906" alt="image" src="https://github.com/user-attachments/assets/cc541cf8-be52-40c5-ab34-44021b16a03f" />


* Sebelum transaksi, pengguna harus memasukkan NIK
* Jika NIK tidak terdaftar:

  * Akan muncul pesan:
    **"NIK TIDAK TERDAFTAR, HARAP LAKUKAN PENDAFTARAN"**
  * Dialihkan ke halaman tambah pelanggan

###  Penjualan LPG
<img width="1919" height="901" alt="image" src="https://github.com/user-attachments/assets/793f1d29-11ba-4b24-84b2-4f9223735c51" />

* Input jumlah pembelian tabung
* Validasi berdasarkan jenis pelanggan:

  * Rumah Tangga: maksimal 3 tabung
  * Usaha: maksimal 5 tabung
* Stok akan otomatis berkurang setelah transaksi

###  Laporan Penjualan (Read & Delete)

<img width="1919" height="906" alt="image" src="https://github.com/user-attachments/assets/2e9bef9f-588e-4c21-bcc8-09fd1a2be630" />


* Menampilkan daftar transaksi penjualan
* Menampilkan:

  * Nama
  * NIK
  * Jumlah pembelian
* Fitur hapus data penjualan (Delete)





##  Widget yang Digunakan

Berikut beberapa widget Flutter yang digunakan dalam aplikasi:

* `MaterialApp` → Struktur utama aplikasi
* `Scaffold` → Layout dasar halaman
* `AppBar` → Header aplikasi dengan gradient
* `TextField` → Input data (NIK, Nama, Alamat)
* `DropdownButtonFormField` → Pilihan jenis pelanggan
* `ListView` → Menampilkan daftar data
* `Card` → Tampilan data agar lebih rapi
* `ElevatedButton` → Tombol aksi
* `SnackBar` → Notifikasi
* `AlertDialog` → Popup konfirmasi
* `Navigator` → Perpindahan halaman
* `Icon` → Ikon UI
* `Container` → Styling (gradient, padding, 
