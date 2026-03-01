import 'package:flutter/material.dart';
import '../widgets/appbar_gradient.dart';
import '../widgets/menu_card.dart';
import '../widgets/stok_card.dart';

import 'validasi_nik_page.dart';
import 'tambah_pelanggan_page.dart';
import 'laporan_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // 🔥 POPUP LOGOUT
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text("Logout"),
        content: const Text("Yakin ingin keluar dari aplikasi?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);

              // 🔥 balik ke login + hapus semua halaman
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
                (route) => false,
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔥 APPBAR + LOGOUT
      appBar: AppBarGradient(
        title: "LPG App",
      ),

      // 🔥 FLOATING LOGOUT BUTTON (karena AppBarGradient custom)
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.logout),
        onPressed: () {
          _showLogoutDialog(context);
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            const StokCard(),
            const SizedBox(height: 20),

            MenuCard(
              icon: Icons.local_gas_station,
              title: "Input Penjualan",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ValidasiNikPage()));
              },
            ),

            MenuCard(
              icon: Icons.person_add,
              title: "Tambah Pelanggan",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TambahPelangganPage()));
              },
            ),

            MenuCard(
              icon: Icons.list_alt,
              title: "Laporan Penjualan",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => LaporanPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}