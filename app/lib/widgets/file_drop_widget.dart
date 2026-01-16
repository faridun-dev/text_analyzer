import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FileDropWidget extends StatefulWidget {
  bool dragging;
  FileDropWidget({super.key, required this.dragging});

  @override
  State<FileDropWidget> createState() => _FileDropWidgetState();
}

class _FileDropWidgetState extends State<FileDropWidget> {
  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) {
        setState(() {});
      },
      onDragEntered: (detail) {
        setState(() {
          widget.dragging = true;
        });
      },
      onDragExited: (detail) {
        setState(() {
          widget.dragging = false;
        });
      },
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(8),
          strokeWidth: 2,
          dashPattern: [8, 4],
          color: !widget.dragging ? Color(0xFF374151) : Color(0xFF1D4ED8),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.dragging ? Color(0xFFEFF6FF) : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/file-diff.svg",
                colorFilter: ColorFilter.mode(
                  !widget.dragging ? Color(0xFF374151) : Color(0xFF1D4ED8),
                  BlendMode.srcIn,
                ),
              ),
              Text(
                "Drop here",
                style: TextStyle(
                  color: widget.dragging
                      ? Color(0xFF1D4ED8)
                      : Color(0xFF374151),
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1D4ED8),
                  foregroundColor: Colors.white,
                ),
                child: Text("Upload"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
