import 'package:flutter/material.dart';
import 'package:project_akbar_database/halaman_utama.dart';
//NAMA : FADILAH AKBAR
//NIM  : 124200017

// Contoh pemanggilan class ditempat lain agar bisa digunakan
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Untuk memanggil nama class pada directory lain, import terlebih dahulu class tersebut diatas
    // Setelah diimport, panggil nama class tersebut
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}