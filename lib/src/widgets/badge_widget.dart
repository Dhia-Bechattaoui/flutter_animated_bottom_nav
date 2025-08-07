import 'package:flutter/material.dart';
import '../models/badge_style.dart';

/// A widget that displays a badge with count and customizable styling
class BadgeWidget extends StatelessWidget {
  final int count;
  final BadgeStyle style;

  const BadgeWidget({
    super.key,
    required this.count,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = count > 99 ? '99+' : count.toString();

    return Container(
      constraints: BoxConstraints(
        minWidth: style.minSize?.width ?? 16,
        minHeight: style.minSize?.height ?? 16,
        maxWidth: style.maxSize?.width ?? double.infinity,
        maxHeight: style.maxSize?.height ?? double.infinity,
      ),
      padding: style.padding,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: style.borderRadius,
        border: style.borderColor != null
            ? Border.all(
                color: style.borderColor!,
                width: style.borderWidth,
              )
            : null,
      ),
      child: Center(
        child: Text(
          displayText,
          style: TextStyle(
            color: style.textColor,
            fontSize: style.fontSize,
            fontWeight: style.fontWeight,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
