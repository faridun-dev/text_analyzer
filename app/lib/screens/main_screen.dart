import 'package:flutter/material.dart';
import 'package:text_analyzer_app/screens/unigramm_screen.dart';
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
    BatchAnalysisSection(),
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
            flex: 1,
            child: Sidebar(
              items: [
                SidebarItem(
                  title: "Униграмма",
                  icon: "assets/file-chart-pie.svg",
                  selected: _selectedIndex == 0,
                  onTap: () {
                    _onItemTapped(0);
                  },
                ),
                SidebarItem(
                  title: "Настройки",
                  icon: "assets/settings.svg",
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
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
