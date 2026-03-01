import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class StokCard extends StatelessWidget {
  const StokCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0D47A1),
            Color(0xFF42A5F5),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_gas_station,
              color: Colors.white, size: 40),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Stok LPG",
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                "$stokTabung Tabung",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}