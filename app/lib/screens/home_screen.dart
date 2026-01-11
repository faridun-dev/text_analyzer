import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DropTarget(
        onDragDone: (detail) {
          setState(() {});
        },
        onDragEntered: (detail) {
          setState(() {
            _dragging = true;
          });
        },
        onDragExited: (detail) {
          setState(() {
            _dragging = false;
          });
        },
        child: Container(
          height: 200,
          width: 200,
          color: _dragging ? Colors.blue.withOpacity(0.4) : Colors.black26,
          child: const Center(child: Text("Drop here")),
        ),
      ),
    );
  }
}
