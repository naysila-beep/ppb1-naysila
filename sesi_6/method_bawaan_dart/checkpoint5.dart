void main() {
  Map<String, int> stok = {'Bengbeng': 35, 'Promina Snack': 15, 'Pop Mie Ayam': 20};
  print(stok.keys);
  print(stok.values);
  print(stok.containsKey('Bengbeng'));
  stok.remove('Bengbeng');
  print(stok);
  int total = 0;
  for (var jumlah in stok.values) {
  total += jumlah;
  }
  print('Total stok: $total');
}