import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => scale = 0.95),
      onTapUp: (_) {
        setState(() => scale = 1);
        widget.onTap();
      },
      onTapCancel: () => setState(() => scale = 1),

      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 100),

        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF1E88E5),
                Color(0xFF64B5F6),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),

          child: Row(
            children: [
              const Icon(Icons.local_gas_station,
                  color: Colors.white, size: 30),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 16)
            ],
          ),
        ),
      ),
    );
  }
}