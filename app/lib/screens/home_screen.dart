import 'package:flutter/material.dart';
import 'package:text_analyzer_app/widgets/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      body: Row(
        children: [
          Expanded(child: Sidebar()),
          Expanded(flex: 5, child: Column(children: [Text("Analyzer")])),
        ],
      ),
    );
  }
}
