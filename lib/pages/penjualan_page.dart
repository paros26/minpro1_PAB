import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class PenjualanPage extends StatefulWidget {
  final Map pelanggan;

  PenjualanPage({required this.pelanggan});

  @override
  _PenjualanPageState createState() => _PenjualanPageState();
}

class _PenjualanPageState extends State<PenjualanPage> {
  final jumlah = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Penjualan")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama: ${widget.pelanggan['nama']}"),
            Text("Kategori: ${widget.pelanggan['kategori']}"),
            SizedBox(height: 10),

            // 🔥 tampilkan stok
Text(
  "Stok Tabung: $stokTabung",
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: stokTabung < 10 ? Colors.red : Colors.green,
  ),
),
            TextField(
              controller: jumlah,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Jumlah Tabung"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                int jml = int.parse(jumlah.text);

                int max = widget.pelanggan['kategori'] == "Rumah Tangga" ? 3 : 5;

                // 🔥 validasi kategori
                if (jml > max) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Maksimal $max tabung")),
                  );
                  return;
                }

                // 🔥 validasi stok
                if (jml > stokTabung) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Stok tidak cukup!")),
                  );
                  return;
                }

                // 🔥 kurangi stok
                setState(() {
                  stokTabung -= jml;
                });

                // simpan data
                penjualanList.add({
                  'nik': widget.pelanggan['nik'],
                  'nama': widget.pelanggan['nama'],
                  'jumlah': jml,
                  'tanggal': DateTime.now().toString(),
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Penjualan berhasil")),
                );

                showDialog(
  context: context,
  builder: (_) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    title: Text("Berhasil"),
    content: Text("Penjualan berhasil disimpan"),
    actions: [
      ElevatedButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      )
    ],
  ),
);
              },
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}