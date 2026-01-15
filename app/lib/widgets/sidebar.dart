import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final List<Widget> items;
  const Sidebar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: BeveledRectangleBorder(),
      child: ListView(
        padding: EdgeInsets.all(8),
        children: items.map((item) => item).toList(),
      ),
    );
  }
}
