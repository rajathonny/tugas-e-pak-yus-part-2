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
    jumlah = widget.initialQuantity.clamp(1, widget.stok);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            if (jumlah > 1) {
              setState(() {
                jumlah--;
                widget.onQuantityChanged?.call(jumlah);
              });
            }
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
                const SnackBar(
                  content: Text('Stok tidak mencukupi'),
                  duration: Duration(seconds: 2),
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