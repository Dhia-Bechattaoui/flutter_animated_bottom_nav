import 'package:flutter/material.dart';

/// Defines the style for badges displayed on navigation items
class BadgeStyle {
  /// Background color of the badge
  final Color backgroundColor;

  /// Text color of the badge
  final Color textColor;

  /// Border color of the badge
  final Color? borderColor;

  /// Border width of the badge
  final double borderWidth;

  /// Border radius of the badge
  final BorderRadius borderRadius;

  /// Font size of the badge text
  final double fontSize;

  /// Font weight of the badge text
  final FontWeight fontWeight;

  /// Padding inside the badge
  final EdgeInsets padding;

  /// Minimum size of the badge
  final Size? minSize;

  /// Maximum size of the badge
  final Size? maxSize;

  /// Whether to show the badge even when count is 0
  final bool showZero;

  const BadgeStyle({
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.borderColor,
    this.borderWidth = 0.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    this.minSize,
    this.maxSize,
    this.showZero = false,
  });

  /// Creates a copy of this BadgeStyle with updated properties
  BadgeStyle copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    double? fontSize,
    FontWeight? fontWeight,
    EdgeInsets? padding,
    Size? minSize,
    Size? maxSize,
    bool? showZero,
  }) {
    return BadgeStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      padding: padding ?? this.padding,
      minSize: minSize ?? this.minSize,
      maxSize: maxSize ?? this.maxSize,
      showZero: showZero ?? this.showZero,
    );
  }
}
