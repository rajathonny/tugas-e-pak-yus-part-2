import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('kopss sekulah'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text ('buku tulis'),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('anggota : Rp 3.000'),
                  SizedBox(height: 8),
                  Text('umum : Rp 3.500'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
/*
antar muka disusun bertingkat untuk menentukan
struktur visual dan tata lekat komponen secara teratur 
dan memudahkan untuk dikelola oleh pengelola aplikasi.
*/
}
