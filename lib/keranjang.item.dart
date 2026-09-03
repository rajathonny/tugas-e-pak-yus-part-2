import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final ValueChanged<int>? onQuantityChanged;
  final int initialQuantity;

  const KeranjangItem({
    super.key,
    required this.stok,
    this.onQuantityChanged,
    this.initialQuantity = 1,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  late int jumlah;

  @override
  void initState() {
    super.initState();
    print('initState dipanggil');
  }

  @override
  void dispose() {
    print('dispose dipanggil');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build dipanggil');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (jumlah > 1) {
                jumlah--;
                widget.onQuantityChanged?.call(jumlah);
              }
            });
          },
          icon: const Icon(Icons.remove),
        ),
        Text('$jumlah'),
        IconButton(
          onPressed: () {
            if (jumlah < widget.stok) {
              setState(() {
                jumlah++;
                widget.onQuantityChanged?.call(jumlah);
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Stok tidak mencukupi'),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}