import 'package:flutter/material.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  List<Map<String, dynamic>> laporanPenjualan = [
    {
      "nama": "Budi",
      "nik": "123456",
      "jumlah": 2,
      "tanggal": "2026-02-28"
    },
    {
      "nama": "Siti",
      "nik": "654321",
      "jumlah": 1,
      "tanggal": "2026-02-27"
    },
  ];

  void hapusData(int index) {
    setState(() {
      laporanPenjualan.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Data berhasil dihapus"),
        backgroundColor: Colors.red,
      ),
    );
  }

  void konfirmasiHapus(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                hapusData(index);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan Penjualan"),
        backgroundColor: Colors.blue,
      ),
      body: laporanPenjualan.isEmpty
          ? Center(child: Text("Belum ada data"))
          : ListView.builder(
              itemCount: laporanPenjualan.length,
              itemBuilder: (context, index) {
                final data = laporanPenjualan[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    title: Text(data['nama']),
                    subtitle: Text(
                        "NIK: ${data['nik']} | Jumlah: ${data['jumlah']}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => konfirmasiHapus(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}