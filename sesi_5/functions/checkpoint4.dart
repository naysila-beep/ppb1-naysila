void sapa(String nama) {
  print("Selamat pagi, $nama");
}

/// function tambah
int tambah(int a, int b) {
  var hasil = a + b;
  return hasil;
}

void main() {
  sapa("enay");

  int hasil = tambah(10, 5);
  print("Hasil: $hasil");

  print(tambah(1, 1));
  print(tambah(10, 19));
}