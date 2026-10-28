import 'fitur.dart';
import 'input.dart';

void main() {
  // Konstanta warna khusus untuk menghias tampilan Menu Utama
  const String reset = '\x1B[0m';
  const String tebal = '\x1B[1m';
  const String magenta = '\x1B[35m';
  const String putih = '\x1B[37m';

  print('$tebal$magenta=== Absensi Kelas ===$reset');
  var berjalan = true;

  while (berjalan) {
    print('');
    print('$tebal$putih' '1. Ubah status absensi$reset');
    print('$tebal$putih' '2. Rekap per mahasiswa$reset');
    print('$tebal$putih' '3. Mahasiswa di bawah batas hadir$reset');
    print('$tebal$putih' '0. Keluar$reset');

    print('');

    final pilihan = bacaInt('Pilih menu', min: 0, max: 3);
    switch (pilihan) {
      case 1:
        ubahStatus();
        break;
      case 2:
        tampilkanRekap();
        break;
      case 3:
        tampilkanDiBawahBatas();
        break;
      case 0:
        berjalan = false;
        break;
    }
  }

  print('\n$tebal$magenta' 'Terima kasih. Program selesai.$reset');
}
