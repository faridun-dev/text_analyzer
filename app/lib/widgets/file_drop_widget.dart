import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:file_picker/file_picker.dart';

class FileDropWidget extends StatefulWidget {
  bool dragging;
  final Function(List<String>)? onFilesSelected; // Callback for selected files
  
  FileDropWidget({
    super.key, 
    required this.dragging,
    this.onFilesSelected,
  });

  @override
  State<FileDropWidget> createState() => _FileDropWidgetState();
}

class _FileDropWidgetState extends State<FileDropWidget> {
  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );

    if (result != null) {
      List<String> filePaths = result.paths.whereType<String>().toList();
      widget.onFilesSelected?.call(filePaths);
      
      // Optional: Print selected files for debugging
      print('Selected files: $filePaths');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) {
        List<String> filePaths = detail.files.map((file) => file.path).toList();
        widget.onFilesSelected?.call(filePaths);
        setState(() {
          widget.dragging = false;
        });
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
                onPressed: _pickFiles,
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