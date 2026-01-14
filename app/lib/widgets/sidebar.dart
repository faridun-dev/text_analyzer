import 'package:flutter/material.dart';
import 'package:text_analyzer_app/widgets/sidebar_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shape: BeveledRectangleBorder(),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(8),
        children: [
          SidebarItem(title: "Home", icon: Icons.home_rounded),
          SidebarItem(title: "Files", icon: Icons.file_present_rounded),
          SidebarItem(title: "Settings", icon: Icons.settings_rounded),
        ],
      ),
    );
  }
}
