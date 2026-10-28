void main() {
  final angkatan = <int, List<String>>{
  2020: ['enay', 'carlisle'],
  2021: ['taeyong', 'paul'],
  };
  outerLoop:
  for (final tahun in angkatan.keys) {
  for (final mhs in angkatan[tahun]!) {
  print('Angkatan $tahun - $mhs');
  if (mhs == 'carlisle') {
  print('Berhenti di carlisle!');
  break outerLoop; // Hentikan semua loop.
  }
  }
  }
}