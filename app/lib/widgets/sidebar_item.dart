import 'package:flutter/material.dart';

class SidebarItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool selected;

  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
  });

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        onEnter: (event) => setState(() {
          _isHovering = true;
        }),
        onExit: (event) => setState(() {
          _isHovering = false;
        }),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: widget.selected
                ? Color(0xFFEFF6FF)
                : _isHovering
                ? Color(0xFFF3F4F6)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  widget.icon,
                  color: !widget.selected
                      ? Color(0xFF374151)
                      : Color(0xFF1D4ED8),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: !widget.selected
                      ? Color(0xFF374151)
                      : Color(0xFF1D4ED8),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
