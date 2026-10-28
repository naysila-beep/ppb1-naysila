import 'package:uuid/uuid.dart';

void main() {
  // Membuat objek Uuid
  var uuid = Uuid();

  // Menghasilkan ID unik versi 4
  String id = uuid.v4();

  // Menampilkan hasil ID unik ke konsol
  print(id);
}
