void main() {
  List<String> nama = ['Dewi', 'Andi', 'Citra', 'Budi'];

  nama.add('Eko');
  nama.remove('Citra');
  nama.sort((a, b) => a.compareTo(b));

  print(nama);
  print('Jumlah: ${nama.length}');
}
