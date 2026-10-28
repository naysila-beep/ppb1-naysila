Map<String, dynamic> getMahasiswa() {
  return {
    "nama": "Lalaaaaaa",
    "umur": 19,
    "aktif": true,
  };
}

void main() {
  Map<String, dynamic> mahasiswa = getMahasiswa();
  print(mahasiswa);
}
