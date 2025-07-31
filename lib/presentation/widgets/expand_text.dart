import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final design = DesignConfig.current;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _expanded ? null : 5,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: design.subTextFontSize,
            fontWeight: design.light,
            fontFamily: design.fontFamily,
            color: design.subTextColor,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Text(
            _expanded ? 'Show less' : 'Read more',
            style: TextStyle(
              fontSize: design.subTextFontSize,
              fontWeight: design.semiBold,
              color: design.primaryColor,
              fontFamily: design.fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
