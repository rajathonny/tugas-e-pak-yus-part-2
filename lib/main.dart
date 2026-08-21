import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: KoperasiPage(),
    );
  }
}

class KoperasiPage extends StatefulWidget {
  const KoperasiPage({super.key});

  @override
  State<KoperasiPage> createState() => _KoperasiPageState();
}

class _KoperasiPageState extends State<KoperasiPage> {
  // Nilai stok dapat diubah di sini
  int stok = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'kopses sekulah',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.all(20),
        child: ListTile(
          leading: const Icon(Icons.inventory_2),
          title: const Text('buku tulis'),
          subtitle: const Text('anggota Rp 3.000 | umum Rp 3.500'),
          trailing: Text(
            'Stok $stok', // Menggunakan interpolasi string yang benar
            style: TextStyle(
              color: stok == 0 ? Colors.red : Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}