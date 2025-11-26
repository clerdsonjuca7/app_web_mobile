import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Time App',
        style: TextStyle(
          fontSize: 20,
          color: Colors.orange,
          fontFamily: 'Schyler',
        ),
      ),
      actions: <Widget>[
        PopupMenuButton<int>(
          onSelected: (item) => handleClick(item),
          itemBuilder: (context) => [
            const PopupMenuItem<int>(value: 0, child: Text('Logout')),
            const PopupMenuItem<int>(value: 1, child: Text('Settings')),
          ],
        ),
      ],
    );
  }

  void handleClick(int item) {
    switch (item) {
      case 0:
        // ação do logout
        break;
      case 1:
        // ação das config
        break;
    }
  }
}
