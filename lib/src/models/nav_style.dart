import 'package:flutter/material.dart';
import 'badge_style.dart';

/// Defines the overall style and behavior of the animated bottom navigation bar
class NavStyle {
  /// Background color of the navigation bar
  final Color backgroundColor;

  /// Color of selected items
  final Color selectedColor;

  /// Color of unselected items
  final Color unselectedColor;

  /// Background color of the selected item indicator
  final Color? selectedItemBackgroundColor;

  /// Border radius of the selected item indicator
  final BorderRadius selectedItemBorderRadius;

  /// Height of the navigation bar
  final double height;

  /// Padding around the navigation bar
  final EdgeInsets padding;

  /// Margin around the navigation bar
  final EdgeInsets margin;

  /// Border radius of the navigation bar
  final BorderRadius borderRadius;

  /// Elevation/shadow of the navigation bar
  final double elevation;

  /// Shadow color of the navigation bar
  final Color? shadowColor;

  /// Border of the navigation bar
  final Border? border;

  /// Default badge style for all items
  final BadgeStyle defaultBadgeStyle;

  /// Animation duration for transitions
  final Duration animationDuration;

  /// Animation curve for transitions
  final Curve animationCurve;

  /// Whether to show labels below icons
  final bool showLabels;

  /// Whether to show selected item background
  final bool showSelectedItemBackground;

  /// Icon size for navigation items
  final double iconSize;

  /// Label font size
  final double labelFontSize;

  /// Label font weight
  final FontWeight labelFontWeight;

  /// Spacing between icon and label
  final double iconLabelSpacing;

  const NavStyle({
    this.backgroundColor = Colors.white,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
    this.selectedItemBackgroundColor,
    this.selectedItemBorderRadius = const BorderRadius.all(Radius.circular(12)),
    this.height = 80.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.margin = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.elevation = 8.0,
    this.shadowColor,
    this.border,
    this.defaultBadgeStyle = const BadgeStyle(),
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.showLabels = true,
    this.showSelectedItemBackground = true,
    this.iconSize = 24.0,
    this.labelFontSize = 12.0,
    this.labelFontWeight = FontWeight.w500,
    this.iconLabelSpacing = 4.0,
  });

  /// Creates a copy of this NavStyle with updated properties
  NavStyle copyWith({
    Color? backgroundColor,
    Color? selectedColor,
    Color? unselectedColor,
    Color? selectedItemBackgroundColor,
    BorderRadius? selectedItemBorderRadius,
    double? height,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BorderRadius? borderRadius,
    double? elevation,
    Color? shadowColor,
    Border? border,
    BadgeStyle? defaultBadgeStyle,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? showLabels,
    bool? showSelectedItemBackground,
    double? iconSize,
    double? labelFontSize,
    FontWeight? labelFontWeight,
    double? iconLabelSpacing,
  }) {
    return NavStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedColor: selectedColor ?? this.selectedColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      selectedItemBackgroundColor:
          selectedItemBackgroundColor ?? this.selectedItemBackgroundColor,
      selectedItemBorderRadius:
          selectedItemBorderRadius ?? this.selectedItemBorderRadius,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      border: border ?? this.border,
      defaultBadgeStyle: defaultBadgeStyle ?? this.defaultBadgeStyle,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      showLabels: showLabels ?? this.showLabels,
      showSelectedItemBackground:
          showSelectedItemBackground ?? this.showSelectedItemBackground,
      iconSize: iconSize ?? this.iconSize,
      labelFontSize: labelFontSize ?? this.labelFontSize,
      labelFontWeight: labelFontWeight ?? this.labelFontWeight,
      iconLabelSpacing: iconLabelSpacing ?? this.iconLabelSpacing,
    );
  }
}
