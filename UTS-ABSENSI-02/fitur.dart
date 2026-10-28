import 'data.dart';
import 'input.dart';

// ============================================================
// Kode Warna ANSI Terminal (Konstanta)
// ============================================================
const String reset = '\x1B[0m';
const String merah = '\x1B[31m';
const String hijau = '\x1B[32m';
const String kuning = '\x1B[33m';
const String biru = '\x1B[34m';
const String cyan = '\x1B[36m';
const String tebal = '\x1B[1m';

// ============================================================
// Fungsi bantu bawaan
// ============================================================

Map<String, dynamic>? cariByNim(String nim) {
  for (final mhs in daftarMahasiswa) {
    if (mhs['nim'] == nim) return mhs;
  }
  return null;
}

void cetakMahasiswa(Map<String, dynamic> mhs) {
  print('${mhs['nim']} | ${mhs['nama']}');
}

StatusHadir bacaStatus(String label) {
  final pilihan = bacaInt(
    '$label (1=hadir, 2=izin, 3=sakit, 4=alpa)',
    min: 1,
    max: 4,
  );
  return switch (pilihan) {
    1 => StatusHadir.hadir,
    2 => StatusHadir.izin,
    3 => StatusHadir.sakit,
    _ => StatusHadir.alpa,
  };
}

// ============================================================
// Tiga Fitur Utama UTS (Tampilan Berwarna & Rapi)
// ============================================================

/// Menu 1 di main.dart baru: mengubah status absensi seorang mahasiswa.
void ubahStatus() {
  print('\n$biru=========================================$reset');
  print('$tebal$biru       [ MENU: UBAH STATUS ABSENSI ]     $reset');
  print('$biru=========================================$reset');
  
  if (absensi.isEmpty) {
    print('$kuning[!] Belum ada data absensi yang tercatat.$reset');
    print('$biru=========================================$reset');
    return;
  }

  final nomor = bacaInt('Masukan Nomor Pertemuan', min: 1, max: absensi.length);
  final nim = bacaTeks('Masukan NIM Mahasiswa');
  final mhs = cariByNim(nim);
  
  if (mhs == null) {
    print('\n$merah[X] Error: Mahasiswa dengan NIM $nim tidak ditemukan.$reset');
    print('$biru=========================================$reset');
    return;
  }

  final statusBaru = bacaStatus('Pilih Status Baru');
  absensi[nomor]![nim] = statusBaru;
  
  // Penentuan warna berdasarkan status baru
  String warnaStatus = reset;
  if (statusBaru == StatusHadir.hadir) warnaStatus = tebal + hijau;
  if (statusBaru == StatusHadir.izin || statusBaru == StatusHadir.sakit) warnaStatus = tebal + kuning;
  if (statusBaru == StatusHadir.alpa) warnaStatus = tebal + merah;

  print('\n$hijau[✓] BERHASIL DIPERBARUI!$reset');
  print('Status Kehadiran : ${tebal}${mhs['nama']}$reset');
  print('Sesi Pertemuan   : ke-$nomor');
  print('Status Baru      : $warnaStatus${statusBaru.name.toUpperCase()}$reset');
  print('$biru=========================================$reset');
}

/// Menu 2 di main.dart baru: menampilkan jumlah setiap status per mahasiswa.
void tampilkanRekap() {
  print('\n$cyan====================================================================$reset');
  print('$tebal$cyan            [ LAPORAN REKAPITULASI ABSENSI MAHASISWA ]             $reset');
  print('$cyan                    Total Pertemuan: ${absensi.length} Sesi                  $reset');
  print('$cyan====================================================================$reset');
  
  if (daftarMahasiswa.isEmpty) {
    print('$kuning[!] Belum ada data mahasiswa di dalam sistem.$reset');
    print('$cyan====================================================================$reset');
    return;
  }

  // Header Tabel
  print('$tebal${'NAMA MAHASISWA'.padRight(25)} | HADIR | IZIN | SAKIT | ALPA$reset');
  print('--------------------------------------------------------------------');

  for (final mhs in daftarMahasiswa) {
    final nim = mhs['nim'] as String;
    final nama = mhs['nama'] as String;
    var hadir = 0;
    var izin = 0;
    var sakit = 0;
    var alpa = 0;

    for (final pertemuan in absensi.values) {
      final status = pertemuan[nim];
      switch (status) {
        case StatusHadir.hadir: hadir++; break;
        case StatusHadir.izin: izin++; break;
        case StatusHadir.sakit: sakit++; break;
        case StatusHadir.alpa: alpa++; break;
        case null: break;
      }
    }

    // Tampilkan data baris
    print('${nama.padRight(25)} |   $hijau$hadir$reset   |   $kuning$izin$reset  |   $kuning$sakit$reset   |   $merah$alpa$reset');
  }
  print('$cyan====================================================================$reset');
}

/// Menu 3 di main.dart baru: menampilkan mahasiswa dengan kehadiran di bawah batas.
void tampilkanDiBawahBatas() {
  final formatBatas = batasKehadiran % 1 == 0 ? '${batasKehadiran.toInt()}%' : '$batasKehadiran%';
  print('\n$merah==================================================$reset');
  print('$tebal$merah     [ PERINGATAN: KEHADIRAN DI BAWAH $formatBatas ]     $reset');
  print('$merah==================================================$reset');

  if (absensi.isEmpty) {
    print('$kuning[!] Belum ada data absensi yang tercatat.$reset');
    print('$merah==================================================$reset');
    return;
  }

  var adaDiBawahBatas = false;
  print('$tebal${'NAMA MAHASISWA'.padRight(25)} | PERSENTASE$reset');
  print('--------------------------------------------------');

  for (final mhs in daftarMahasiswa) {
    final nim = mhs['nim'] as String;
    final nama = mhs['nama'] as String;
    var hadir = 0;

    for (final pertemuan in absensi.values) {
      if (pertemuan[nim] == StatusHadir.hadir) {
        hadir++;
      }
    }

    final persentase = (hadir / absensi.length) * 100;
    
    if (persentase < batasKehadiran) {
      adaDiBawahBatas = true;
      // Cetak dengan teks tebal merah mencolok
      print('${nama.padRight(25)} | $tebal$merah${persentase.toStringAsFixed(1)}% [!]$reset');
    }
  }

  if (!adaDiBawahBatas) {
    print('$hijau✓ Semua mahasiswa memenuhi batas kehadiran minimum.$reset');
  }
  print('$merah==================================================$reset');
}

// Fungsi menu sisa template lama (dikosongkan karena menu main.dart sudah dibatasi)
void tampilkanDaftar() {}
void catatAbsensi() {}
void tampilkanAbsensiPertemuan() {}
void tambahMahasiswa() {}
void cariMahasiswa() {}
void tampilkanPersentase() {}
