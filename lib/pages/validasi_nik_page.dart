import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'penjualan_page.dart';
import 'tambah_pelanggan_page.dart';

class ValidasiNikPage extends StatelessWidget {
  final TextEditingController nikController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validasi NIK"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.orange],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),

            // 🔥 TextField modern
            TextField(
              controller: nikController,
              decoration: InputDecoration(
                labelText: "Masukkan NIK",
                prefixIcon: Icon(Icons.badge),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            SizedBox(height: 20),

            // 🔥 Button modern
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                var data = pelangganList
                    .where((p) => p['nik'] == nikController.text)
                    .toList();

                // ✅ jika ditemukan
                if (data.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          PenjualanPage(pelanggan: data[0]),
                    ),
                  );
                }

                // ❌ jika tidak ditemukan
                else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red),
                          SizedBox(width: 10),
                          Text("Peringatan"),
                        ],
                      ),
                      content: Text(
                        "NIK TIDAK TERDAFTAR\nHarap lakukan pendaftaran terlebih dahulu",
                      ),
                      actions: [
                        TextButton(
                          child: Text("Batal"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text("Daftar"),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    TambahPelangganPage(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                }
              },
              child: Text(
                "Cek NIK",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}