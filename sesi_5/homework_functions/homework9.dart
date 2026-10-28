void hitungTotal(int harga, [int jumlah = 1]) {
  int total = harga * jumlah;
  print("Total: Rp$total");
}

void main() {
  hitungTotal(450000);
  hitungTotal(450000, 3);
}
