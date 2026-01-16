import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FileItem extends StatelessWidget {
  final String fileName;
  final double fileSize;
  const FileItem({super.key, required this.fileName, required this.fileSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF6B7280)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/file-text.svg",
            width: 45,
            colorFilter: ColorFilter.mode(Color(0xFF374151), BlendMode.srcIn),
          ),
          SizedBox(height: 5),
          Text(
            fileName,
            softWrap: true,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Color(0xFF374151), fontSize: 12),
          ),
          SizedBox(height: 5),
          Text(
            "$fileSize MB",
            style: TextStyle(color: Color(0xFF374151), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
