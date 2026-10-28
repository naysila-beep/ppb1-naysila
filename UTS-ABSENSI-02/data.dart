/// Status kehadiran mahasiswa dalam satu pertemuan.
enum StatusHadir { hadir, izin, sakit, alpa }

/// Persentase kehadiran minimal (dalam persen).
const double batasKehadiran = 75;

/// Data awal mahasiswa dengan nama baru sesuai request.
final List<Map<String, dynamic>> daftarMahasiswa = [
  {'nim': '2401001', 'nama': 'Dwi Restari Ningsih'},
  {'nim': '2401002', 'nama': 'Suci Amelia'},
  {'nim': '2401003', 'nama': 'Fitri Oktavia'},
  {'nim': '2401004', 'nama': 'Siti Fauziah'},
];

/// Absensi setiap pertemuan.
///
/// Key luar = nomor pertemuan, key dalam = NIM, value = status kehadiran.
final Map<int, Map<String, StatusHadir>> absensi = {
  1: {
    '2401001': StatusHadir.hadir,
    '2401002': StatusHadir.hadir,
    '2401003': StatusHadir.hadir,
    '2401004': StatusHadir.alpa,
  },
  2: {
    '2401001': StatusHadir.hadir,
    '2401002': StatusHadir.izin,
    '2401003': StatusHadir.hadir,
    '2401004': StatusHadir.hadir,
  },
  3: {
    '2401001': StatusHadir.hadir,
    '2401002': StatusHadir.hadir,
    '2401003': StatusHadir.sakit,
    '2401004': StatusHadir.alpa,
  },
  4: {
    '2401001': StatusHadir.hadir,
    '2401002': StatusHadir.hadir,
    '2401003': StatusHadir.izin,
    '2401004': StatusHadir.alpa,
  },
};
