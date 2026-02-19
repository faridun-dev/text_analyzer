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
    _SubPage1(),
    _SubPage2(),
    _SubPage3(),
    _SubPage4(),
    SettingsScreen(),
  ];

  int _selectedIndex = 0;
  bool _isAnalysisExpanded = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAnalysisExpanded(bool expanded) {
    setState(() {
      _isAnalysisExpanded = expanded;
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
                  title: "СРМ",
                  icon: "assets/file-chart-pie.svg",
                  selected: _selectedIndex >= 0 && _selectedIndex < 5,
                  onTap: () {
                    // Don't navigate to a page, just expand/collapse
                  },
                  isExpanded: _isAnalysisExpanded,
                  onExpand: _onAnalysisExpanded,
                  selectedSubIndex: _selectedIndex >= 0 && _selectedIndex < 5
                      ? _selectedIndex
                      : null,
                  subItems: [
                    SubItem(
                      title: "Униграмма",
                      icon: "assets/file-chart-pie.svg",
                      onTap: () => _onItemTapped(0),
                    ),
                    SubItem(
                      title: "Униграмма + Аломат",
                      icon: "assets/file-chart-pie.svg",
                      onTap: () => _onItemTapped(1),
                    ),
                    SubItem(
                      title: "Хичо",
                      icon: "assets/file-chart-pie.svg",
                      onTap: () => _onItemTapped(2),
                    ),
                    SubItem(
                      title: "Калима",
                      icon: "assets/file-chart-pie.svg",
                      onTap: () => _onItemTapped(3),
                    ),
                    SubItem(
                      title: "Дарозии чумла бо калима",
                      icon: "assets/file-chart-pie.svg",
                      onTap: () => _onItemTapped(4),
                    ),
                  ],
                ),
                SidebarItem(
                  title: "Настройки",
                  icon: "assets/settings.svg",
                  selected: _selectedIndex == 5,
                  onTap: () {
                    _onItemTapped(5);
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

// Test subpages
class _SubPage0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.text_fields, size: 64, color: Color(0xFF2563EB)),
            SizedBox(height: 24),
            Text(
              'Униграмма',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Анализ отдельных слов',
              style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2563EB),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Начать анализ'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart, size: 64, color: Color(0xFF2563EB)),
            SizedBox(height: 24),
            Text(
              'Униграмма + Аломат',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Анализ слов с аломатическими вариантами',
              style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2563EB),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Начать анализ'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.analytics, size: 64, color: Color(0xFF059669)),
            SizedBox(height: 24),
            Text(
              'Хичо',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Анализ частых фраз и выражений',
              style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF059669),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Начать анализ'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pie_chart, size: 64, color: Color(0xFFF59E0B)),
            SizedBox(height: 24),
            Text(
              'Калима',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Анализ корней слов',
              style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF59E0B),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Просмотреть анализ'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.assessment, size: 64, color: Color(0xFF7C3AED)),
            SizedBox(height: 24),
            Text(
              'Дарозии чумла бо калима',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Анализ протяженности предложений',
              style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7C3AED),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Начать анализ'),
            ),
          ],
        ),
      ),
    );
  }
}
