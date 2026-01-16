import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({super.key});

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [SvgPicture.asset("assets/file-text.svg")],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: DropTarget(
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
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _dragging ? Color(0xFFF3F4F6) : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: Center(child: Text("Drop here")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
