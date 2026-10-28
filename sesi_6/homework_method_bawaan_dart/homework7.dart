void main() {
  List<Map<String, dynamic>> mahasiswa = [
    {'nama': 'Andi', 'nilai': 80},
    {'nama': 'Budi', 'nilai': 95},
    {'nama': 'Citra', 'nilai': 70},
  ];

  mahasiswa.sort((a, b) => (b['nilai'] as int).compareTo(a['nilai'] as int));

  for (var mhs in mahasiswa) {
    print('${mhs['nama']}: ${mhs['nilai']}');
  }
}
