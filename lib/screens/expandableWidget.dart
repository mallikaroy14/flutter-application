import 'package:flutter/material.dart';

class ExpandableLine extends StatefulWidget {
  final IconData icon;
  final Color color;
  final bool initiallyExpanded;

  const ExpandableLine({
    Key? key,
    required this.icon,
    this.color = Colors.orange,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  State<ExpandableLine> createState() => _ExpandableLineState();
}

class _ExpandableLineState extends State<ExpandableLine> {
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            widget.icon,
            color: widget.color,
          ),
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: _expanded ? 100.0 : 0.0, // Adjust height as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    width: 2.0,
                    height: 2.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.color,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}