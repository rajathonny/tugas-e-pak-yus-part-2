import 'package:flutter/material.dart';
import 'barangcard.dart';

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

IconData getCategoryIcon(String kategori) {
  switch (kategori.toLowerCase()) {
    case 'atk':
      return Icons.book; 
    case 'makanan':
      return Icons.fastfood; 
    case 'minuman':
      return Icons.local_drink;  
    default:
      return Icons.inventory_2;
  }
}

class _KoperasiPageState extends State<KoperasiPage> {
  int stok = 0;

  final List<Map<String, dynamic>> daftarBarang = [
    {'nama': 'kabel lan', 'kategori': 'atk', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 1},
    {'nama': 'kaos kaki', 'kategori': 'atk', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 10},
    {'nama': 'monitor', 'kategori': 'elektronik', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 10},
    {'nama': 'tas sekulah', 'kategori': 'lain', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 10},
    {'nama': 'habibil', 'kategori': 'lain', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 10},
    {'nama': 'habubul', 'kategori': 'lain', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 10},
    {'nama': 'hababal', 'kategori': 'lain', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 10},
    {'nama': 'habobol', 'kategori': 'lain', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 10},
    {'nama': 'hababil', 'kategori': 'lain', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 10},
    {'nama': 'iwak', 'kategori': 'lain', 'harga_anggota': 3000, 'harga_umum': 3500, 'stok': 0},
  ];

  List<Map<String, dynamic>> get barangTersedia =>
      daftarBarang.where((barang) => (barang['stok'] as int) > 0).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'kopses sekulah',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: barangTersedia.length,
        itemBuilder: (context, index) {
          final barang = barangTersedia[index];
          return Barangcard(
            nama: barang['nama'] as String,
            hargaAnggota: barang['harga_anggota'] as int,
            stok: barang['stok'] as int,
            kategori: barang['kategori'] as String,
            sorot: (barang['stok'] as int) <= 1,
          );
        },
      ),
    );
  }
}

