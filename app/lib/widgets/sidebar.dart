import 'package:flutter/material.dart';
import 'package:text_analyzer_app/widgets/sidebar_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: BeveledRectangleBorder(),
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.document_scanner_rounded),
                SizedBox(width: 5),
                Text("Text Analyzer", style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          SidebarItem(title: "Home", icon: Icons.home_rounded, selected: true),
          SidebarItem(
            title: "Files",
            icon: Icons.file_present_rounded,
            selected: false,
          ),
          SidebarItem(
            title: "Settings",
            icon: Icons.settings_rounded,
            selected: false,
          ),
        ],
      ),
    );
  }
}
