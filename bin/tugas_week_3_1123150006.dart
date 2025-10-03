class Mahasiswa {
  // Properties (atribut)
  String nama;
  String nim;
  String jurusan;
  int angkatan;
  // Constructor
  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.angkatan,
  });
  // Method
  void tampilkanData() {
    print("Nama : $nama");
    print("NIM : $nim");
    print("Jurusan : $jurusan");
    print("Angkatan : $angkatan");
  }
}

class AsistenDosen extends Mahasiswa {
  String mataKuliah;
  AsistenDosen({
    required String nama,
    required String nim,
    required String jurusan,
    required int angkatan,
    required this.mataKuliah,
  }) : super(nama: nama, nim: nim, jurusan: jurusan, angkatan: angkatan);
  // Override method
  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Asisten MK: $mataKuliah");
  }
}

abstract class Pendaftaran {
  void daftarMatkul(String matkul);
}

class MahasiswaAktif extends Mahasiswa implements Pendaftaran {
  List<String> matkulDiambil = [];
  MahasiswaAktif({
    required String nama,
    required String nim,
    required String jurusan,
    required int angkatan,
  }) : super(nama: nama, nim: nim, jurusan: jurusan, angkatan: angkatan);

  @override
  void daftarMatkul(String matkul) {
    matkulDiambil.add(matkul);
    print("$nama berhasil daftar mata kuliah $matkul");
  }
}

void main() {
  // Buat object mahasiswa biasa
  var mhs1 = Mahasiswa(
    nama: "Bandung Bondowoso",
    nim: "1123150191",
    jurusan: "Sistem Informasi",
    angkatan: 2022,
  );
  mhs1.tampilkanData();
  print("----------");
  // Buat object asisten dosen
  var asdos = AsistenDosen(
    nama: "Siti Nurhaliza",
    nim: "1123150029",
    jurusan: "bisnis digital",
    angkatan: 2021,
    mataKuliah: "Pengantar Akuntansi",
  );
  asdos.tampilkanData();
  print("----------");
  // Mahasiswa aktif implementasi interface
  var mhs2 = MahasiswaAktif(
    nama: "Muhammad Abdul Rozak",
    nim: "1123150006",
    jurusan: "Teknik Informatika",
    angkatan: 2023,
  );
  mhs2.daftarMatkul("Algoritma");
  mhs2.daftarMatkul("Basis Data");
  mhs2.daftarMatkul("Mobile Apps");
  mhs2.daftarMatkul("Rekayasa Perangkat Lunak");
  mhs2.tampilkanData();
  print("Matkul yang diambil: ${mhs2.matkulDiambil}");
}
