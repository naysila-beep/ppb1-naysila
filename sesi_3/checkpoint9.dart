import 'dart:io';

void main() {
  // Deklarasi variabel boolean
  bool isLoggedIn = false;

  // Meminta input username dari pengguna
  stdout.write("Masukkan username: ");
  String? username = stdin.readLineSync();

  // Contoh logika sederhana: username = admin
  if (username == "admin") {
    isLoggedIn = true;
  }

  // Menampilkan hasil berdasarkan nilai boolean
  if (isLoggedIn) {
    print("Login berhasil! Selamat datang, $username.");
  } else {
    print("Login gagal! Username atau password salah.");
  }
  }