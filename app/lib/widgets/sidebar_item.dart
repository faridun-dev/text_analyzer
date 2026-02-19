import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubItem {
  final String title;
  final String icon;
  final void Function()? onTap;

  SubItem({required this.title, required this.icon, required this.onTap});
}

class SidebarItem extends StatefulWidget {
  final String title;
  final String icon;
  final bool selected;
  final void Function()? onTap;
  final List<SubItem>? subItems;
  final bool isExpanded;
  final void Function(bool)? onExpand;
  final int? selectedSubIndex;

  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
    this.subItems,
    this.isExpanded = false,
    this.onExpand,
    this.selectedSubIndex,
  });

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    if (widget.isExpanded) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(SidebarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.subItems != null && widget.subItems!.isNotEmpty) {
      // Only expand/collapse, don't navigate
      widget.onExpand?.call(!widget.isExpanded);
    } else {
      // No subItems, so this is a regular tappable item
      widget.onTap?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _handleTap,
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
                    child: SvgPicture.asset(
                      widget.icon,
                      colorFilter: ColorFilter.mode(
                        widget.selected ? Color(0xFF1D4ED8) : Color(0xFF374151),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: !widget.selected
                            ? Color(0xFF374151)
                            : Color(0xFF1D4ED8),
                      ),
                    ),
                  ),
                  if (widget.subItems != null && widget.subItems!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: RotationTransition(
                        turns: Tween<double>(
                          begin: 0,
                          end: 0.5,
                        ).animate(_animationController),
                        child: Icon(
                          Icons.chevron_right,
                          color: widget.selected
                              ? Color(0xFF1D4ED8)
                              : Color(0xFF374151),
                          size: 20,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        // Subpages section
        if (widget.subItems != null && widget.subItems!.isNotEmpty)
          SizeTransition(
            sizeFactor: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(_animationController),
            child: Container(
              margin: EdgeInsets.only(left: 16, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(widget.subItems!.length, (index) {
                  final subItem = widget.subItems![index];
                  final isSubSelected =
                      widget.selectedSubIndex == index && widget.selected;
                  bool _isSubHovering = false;

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return GestureDetector(
                        onTap: subItem.onTap,
                        child: MouseRegion(
                          onEnter: (event) => setState(() {
                            _isSubHovering = true;
                          }),
                          onExit: (event) => setState(() {
                            _isSubHovering = false;
                          }),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSubSelected
                                  ? Color(0xFFDEEAF8)
                                  : _isSubHovering
                                  ? Color(0xFFF3F4F6)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  subItem.icon,
                                  width: 16,
                                  height: 16,
                                  colorFilter: ColorFilter.mode(
                                    isSubSelected
                                        ? Color(0xFF1D4ED8)
                                        : Color(0xFF6B7280),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    subItem.title,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: isSubSelected
                                          ? Color(0xFF1D4ED8)
                                          : Color(0xFF6B7280),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
      ],
    );
  }
}
