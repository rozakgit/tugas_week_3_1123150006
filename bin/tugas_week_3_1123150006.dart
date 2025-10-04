/// Class Mahasiswa sebagai class induk (parent class)
/// Berisi data dan perilaku dasar yang dimiliki oleh semua mahasiswa
class Mahasiswa {
  // Properties (atribut) - menyimpan data mahasiswa
  String nama; // Nama lengkap mahasiswa
  String nim; // Nomor Induk Mahasiswa (unik untuk setiap mahasiswa)
  String jurusan; // Program studi yang diambil
  int angkatan; // Tahun masuk kuliah

  // Constructor - fungsi khusus untuk membuat objek mahasiswa baru
  // 'required' artinya parameter wajib diisi saat membuat objek
  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.angkatan,
  });

  // Method untuk menampilkan semua data mahasiswa
  // Method ini bisa di-override oleh class turunan
  void tampilkanData() {
    print("Nama     : $nama");
    print("NIM      : $nim");
    print("Jurusan  : $jurusan");
    print("Angkatan : $angkatan");
  }
}

/// Class AsistenDosen - class turunan dari Mahasiswa
/// Merepresentasikan mahasiswa yang juga bertugas sebagai asisten dosen
/// Konsep: Inheritance (pewarisan) - mewarisi semua sifat dari class Mahasiswa
class AsistenDosen extends Mahasiswa {
  // Property tambahan khusus untuk asisten dosen
  String mataKuliah; // Mata kuliah yang diasisteni

  // Constructor dengan parameter tambahan untuk mata kuliah
  // Menggunakan 'super' untuk memanggil constructor parent class
  AsistenDosen({
    required String nama,
    required String nim,
    required String jurusan,
    required int angkatan,
    required this.mataKuliah, // Parameter baru khusus AsistenDosen
  }) : super(nama: nama, nim: nim, jurusan: jurusan, angkatan: angkatan);

  // Override method tampilkanData dari parent class
  // @override memberitahu bahwa kita sengaja menimpa method yang sudah ada
  @override
  void tampilkanData() {
    super.tampilkanData(); // Panggil method asli dari parent
    print("Asisten MK: $mataKuliah"); // Tambahkan info mata kuliah
  }
}

/// Abstract class (Interface) Pendaftaran
/// Mendefinisikan kontrak/aturan yang harus diikuti oleh class yang mengimplementasinya
/// Abstract class tidak bisa dibuat objeknya, hanya sebagai template
abstract class Pendaftaran {
  // Method abstract - hanya deklarasi tanpa implementasi
  // Class yang implements interface ini WAJIB mengimplementasikan method ini
  void daftarMatkul(String matkul);
}

/// Class MahasiswaAktif - menggabungkan Inheritance dan Interface
/// Konsep: Multiple inheritance (mewarisi dari Mahasiswa + implementasi Pendaftaran)
class MahasiswaAktif extends Mahasiswa implements Pendaftaran {
  // Property untuk menyimpan daftar mata kuliah yang diambil
  List<String> matkulDiambil = []; // List kosong di awal

  // Constructor - hampir sama dengan parent, tapi tanpa mataKuliah
  MahasiswaAktif({
    required String nama,
    required String nim,
    required String jurusan,
    required int angkatan,
  }) : super(nama: nama, nim: nim, jurusan: jurusan, angkatan: angkatan);

  // Implementasi wajib dari interface Pendaftaran
  // Method ini HARUS ada karena kita implements Pendaftaran
  @override
  void daftarMatkul(String matkul) {
    matkulDiambil.add(matkul); // Tambahkan mata kuliah ke list
    print("$nama berhasil daftar mata kuliah: $matkul");
  }

  // Override method tampilkanData untuk menampilkan mata kuliah yang diambil
  @override
  void tampilkanData() {
    super.tampilkanData(); // Tampilkan data dasar mahasiswa
    print(
      "Mata Kuliah: ${matkulDiambil.isEmpty ? 'Belum mengambil mata kuliah' : matkulDiambil.join(', ')}",
    );
  }
}

/// Fungsi main - titik awal eksekusi program
/// Di sini kita akan mendemonstrasikan penggunaan semua class yang telah dibuat
void main() {
  // ========== DEMO 1: MAHASISWA BIASA ==========
  // Membuat objek dari class Mahasiswa (class induk)
  print("=== DEMO 1: MAHASISWA BIASA ===");
  var mhs1 = Mahasiswa(
    nama: "Bandung Bondowoso",
    nim: "1123150191",
    jurusan: "Sistem Informasi",
    angkatan: 2022,
  );

  // Memanggil method tampilkanData() versi class Mahasiswa
  mhs1.tampilkanData();
  print("=" * 40);

  // ========== DEMO 2: ASISTEN DOSEN ==========
  // Membuat objek dari class AsistenDosen (inheritance dari Mahasiswa)
  print("\n=== DEMO 2: ASISTEN DOSEN (INHERITANCE) ===");
  var asdos = AsistenDosen(
    nama: "Siti Nurhaliza",
    nim: "1123150029",
    jurusan: "Bisnis Digital",
    angkatan: 2021,
    mataKuliah: "Pengantar Akuntansi", // Parameter tambahan
  );

  // Memanggil method tampilkanData() versi AsistenDosen (yang sudah di-override)
  asdos.tampilkanData();
  print("=" * 40);

  // ========== DEMO 3: MAHASISWA AKTIF ==========
  // Membuat objek dari class MahasiswaAktif (inheritance + interface)
  print("\n=== DEMO 3: MAHASISWA AKTIF (INHERITANCE + INTERFACE) ===");
  var mhsAktif = MahasiswaAktif(
    nama: "Muhammad Abdul Rozak",
    nim: "1123150006",
    jurusan: "Teknik Informatika",
    angkatan: 2023,
  );

  // Demonstrasi penggunaan method dari interface Pendaftaran
  print("\n--- Proses Pendaftaran Mata Kuliah ---");
  mhsAktif.daftarMatkul("Algoritma dan Pemrograman");
  mhsAktif.daftarMatkul("Basis Data");
  mhsAktif.daftarMatkul("Mobile Apps");
  mhsAktif.daftarMatkul("Rekayasa Perangkat Lunak");

  // Menampilkan data mahasiswa aktif (dengan mata kuliah yang diambil)
  print("\n--- Data Mahasiswa Setelah Pendaftaran ---");
  mhsAktif.tampilkanData();

  // Menampilkan list mata kuliah secara langsung
  print("\nDetail mata kuliah: ${mhsAktif.matkulDiambil}");
  print("Total mata kuliah: ${mhsAktif.matkulDiambil.length}");
}
