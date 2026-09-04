import 'package:flutter/material.dart';

import 'keranjang.item.dart';

class Barangcard extends StatefulWidget {
  final String nama;
  final int hargaAnggota;
  final int stok;
  final String kategori;
  final bool sorot;

  const Barangcard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.stok,
    required this.kategori,
    this.sorot = false,
  });

  @override
  State<Barangcard> createState() => _BarangcardState();
}

class _BarangcardState extends State<Barangcard> {
  int jumlahDiPilih = 1;

  int get totalHarga => widget.hargaAnggota * jumlahDiPilih;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (widget.kategori.toLowerCase()) {
      case 'atk':
        icon = Icons.book;
        break;
      case 'makanan':
        icon = Icons.fastfood;
        break;
      case 'minuman':
        icon = Icons.local_drink;
        break;
      default:
        icon = Icons.inventory_2;
    }

    return Card(
      margin: const EdgeInsets.all(8),
      color: widget.sorot ? Colors.yellow[100] : null,
      child: ListTile(
        leading: Icon(icon),
        title: Row(
          children: [
            Expanded(
              child: Text(
                widget.nama,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Stok: ${widget.stok}',
              style: TextStyle(
                fontSize: 12,
                color: widget.stok > 0 ? Colors.grey[700] : Colors.red,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('anggota: Rp ${widget.hargaAnggota.toString()}'),
            Text('Total: Rp ${totalHarga.toString()}', 
              style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
        trailing: KeranjangItem(
          stok: widget.stok,
          onQuantityChanged: (newQuantity) {
            setState(() {
              jumlahDiPilih = newQuantity;
            });
          },
        )
      ),
    );
  }
}