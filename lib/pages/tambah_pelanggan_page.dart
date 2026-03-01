import 'package:flutter/material.dart';
import '../data/dummy_data.dart'; // ✅ WAJIB ADA

class TambahPelangganPage extends StatefulWidget {
  const TambahPelangganPage({super.key});

  @override
  State<TambahPelangganPage> createState() => _TambahPelangganPageState();
}

class _TambahPelangganPageState extends State<TambahPelangganPage> {

  final TextEditingController nikController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  String jenisPelanggan = "Rumah Tangga";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pelanggan"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff00c853), // hijau terang
                Color(0xff009624), // hijau gelap
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // NIK
            TextField(
              controller: nikController,
              decoration: InputDecoration(
                labelText: "NIK",
                prefixIcon: const Icon(Icons.credit_card),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Nama
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: "Nama",
                prefixIcon: const Icon(Icons.person),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Alamat
            TextField(
              controller: alamatController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: "Alamat",
                prefixIcon: const Icon(Icons.location_on),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Dropdown jenis pelanggan
            DropdownButtonFormField<String>(
              value: jenisPelanggan,
              items: ["Rumah Tangga", "Usaha"]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  jenisPelanggan = value!;
                });
              },
              decoration: InputDecoration(
                labelText: "Jenis Pelanggan",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
  String nik = nikController.text.trim();
  String nama = namaController.text;
  String alamat = alamatController.text;

  if (nik.isEmpty || nama.isEmpty || alamat.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Semua field wajib diisi"),
      ),
    );
    return;
  }

  // ✅ SIMPAN KE GLOBAL LIST (INI YANG PENTING)
  pelangganList.add({
    'nik': nik,
    'nama': nama,
    'alamat': alamat,
    'jenis': jenisPelanggan,
  });

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Pelanggan berhasil ditambahkan"),
    ),
  );

  Navigator.pop(context);
},
                child: const Text(
                  "Simpan",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}