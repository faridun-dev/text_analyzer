import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:text_analyzer_app/widgets/file_drop_widget.dart';
import 'package:text_analyzer_app/widgets/file_item.dart';

class FilesScreen extends StatefulWidget {
  const FilesScreen({super.key});

  @override
  State<FilesScreen> createState() => _FilesScreenState();
}

class _FilesScreenState extends State<FilesScreen> {
  final bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      body: Padding(
        padding: const EdgeInsetsGeometry.only(
          top: 20,
          left: 20,
          bottom: 20,
          right: 0,
        ),
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FileItem(
                    fileName: "Some random 777777 document.docx",
                    fileSize: 2.4,
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: FileDropWidget(
                      dragging: _dragging,
                      onFilesSelected: (List<String> filePaths) {
                        print('Files selected: $filePaths');
                        // Handle the selected files here
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        DataTable(
                          headingTextStyle: TextStyle(color: Color(0xFF6B7280)),
                          dataTextStyle: TextStyle(color: Color(0xFF1A202C)),
                          columns: [
                            DataColumn(label: Text("DOCUMENT NAME")),
                            DataColumn(label: Text("SIZE")),
                          ],
                          rows: List.generate(
                            30,
                            (int index) => DataRow(
                              cells: [
                                DataCell(Text('QA Report.docx')),
                                DataCell(
                                  Row(
                                    children: [
                                      Text('5.6 MB'),
                                      SizedBox(width: 100),
                                      GestureDetector(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                          "assets/trash-2.svg",
                                          colorFilter: ColorFilter.mode(
                                            Color(0xFFE53E3E),
                                            BlendMode.srcIn,
                                          ),
                                          width: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
