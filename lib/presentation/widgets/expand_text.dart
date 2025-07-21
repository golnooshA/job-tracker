import 'package:flutter/cupertino.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _expanded ? null : 5,
          overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: DesignConfig.light,
            fontFamily: DesignConfig.fontFamily,
            color: DesignConfig.subTextColor,
            fontSize: DesignConfig.subTextSize,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Text(
            _expanded ? "Show less" : "Read more",
            style: const TextStyle(
              color: DesignConfig.primaryColor,
              fontWeight: DesignConfig.semiBold,
              fontSize: DesignConfig.subTextSize,
            ),
          ),
        ),
      ],
    );
  }
}

