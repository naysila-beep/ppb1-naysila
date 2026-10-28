void main() {
  List<String> daftarNama = [
    'Lala', 'Lili', 'Lulu', 'Lolo'
  ];
  String kataKunci = 'LA';

  for (var nama in daftarNama) {
    if (nama.toLowerCase().contains(kataKunci.toLowerCase())) {
      print(nama);
    }
  }
}

