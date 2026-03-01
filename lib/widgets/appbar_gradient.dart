import 'package:flutter/material.dart';

class AppBarGradient extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarGradient({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1565C0),
              Color(0xFF42A5F5),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}