import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent files",
              style: TextStyle(color: Color(0xFF111827), fontSize: 20),
            ),
            SizedBox(height: 5),
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
                      children: [
                        SvgPicture.asset(
                          "assets/file-text.svg",
                          width: 45,
                          colorFilter: ColorFilter.mode(
                            Color(0xFF374151),
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Some random 777777 document.docx",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF374151),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "2.4 MB",
                          style: TextStyle(
                            color: Color(0xFF374151),
                            fontSize: 12,
                          ),
                        ),
                      ],
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
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    radius: Radius.circular(8),
                    strokeWidth: 2,
                    dashPattern: [8, 4],
                    color: !_dragging ? Color(0xFF374151) : Color(0xFF1D4ED8),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _dragging ? Color(0xFFEFF6FF) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/file-diff.svg",
                          colorFilter: ColorFilter.mode(
                            !_dragging ? Color(0xFF374151) : Color(0xFF1D4ED8),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          "Drop here",
                          style: TextStyle(
                            color: _dragging
                                ? Color(0xFF1D4ED8)
                                : Color(0xFF374151),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
