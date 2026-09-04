import 'package:flutter/material.dart';
import 'barangcard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KoperasiPage(),
    );
  }
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

class KoperasiPage extends StatefulWidget {
  const KoperasiPage({super.key});

  @override
  State<KoperasiPage> createState() => _KoperasiPageState();
}

class _KoperasiPageState extends State<KoperasiPage> {
  final TextEditingController _controller = TextEditingController();
  String kataCari = '';

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

  List<Map<String, dynamic>> get barangTersedia {
    final query = kataCari.trim().toLowerCase();
    final items = daftarBarang.where((barang) => (barang['stok'] as int) > 0).toList();

    if (query.isEmpty) {
      return items;
    }

    return items
        .where((barang) => (barang['nama'] as String).toLowerCase().contains(query))
        .toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'kopses sekulah',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Cari barang',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (nilai) {
                setState(() {
                  kataCari = nilai.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}