import 'package:flutter/material.dart';
import 'package:text_analyzer_app/screens/files_screen.dart';
import 'package:text_analyzer_app/screens/home_screen.dart';
import 'package:text_analyzer_app/screens/settings_screen.dart';
import 'package:text_analyzer_app/widgets/sidebar.dart';
import 'package:text_analyzer_app/widgets/sidebar_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    FilesScreen(),
    SettingsScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      body: Row(
        children: [
          Expanded(
            child: Sidebar(
              items: [
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
                SidebarItem(
                  title: "Home",
                  icon: "assets/house.svg",
                  selected: _selectedIndex == 0,
                  onTap: () {
                    _onItemTapped(0);
                  },
                ),
                SidebarItem(
                  title: "Files",
                  icon: "assets/folder-open.svg",
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                  },
                ),
                SidebarItem(
                  title: "Settings",
                  icon: "assets/settings.svg",
                  selected: _selectedIndex == 2,
                  onTap: () {
                    _onItemTapped(2);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: IndexedStack(
              index: _selectedIndex,
              children: _widgetOptions,
            ),
          ),
        ],
      ),
    );
  }
}
