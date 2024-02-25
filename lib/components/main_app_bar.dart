import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MainAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xFF26467F),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'lib/images/menu.png',
            width: 26,
            height: 22,
          ),
        ),
        centerTitle: true,
        title: Text(title,
            style: const TextStyle(
              color: Colors.white,
            )),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Filter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
