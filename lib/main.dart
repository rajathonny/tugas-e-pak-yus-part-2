import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('kopsis sekulah'),
        ),
        body: const Center(child: Text('kasir kopsis'),
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
