import 'package:flutter/material.dart';
import 'badge_style.dart';

/// Represents a single navigation item in the bottom navigation bar
class NavItem {
  /// The icon to display for this navigation item
  final IconData icon;

  /// The label text to display below the icon
  final String label;

  /// Optional badge count to display on the icon
  final int? badgeCount;

  /// Custom badge style for this specific item
  final BadgeStyle? badgeStyle;

  /// Custom color for this specific item when selected
  final Color? selectedColor;

  /// Custom color for this specific item when unselected
  final Color? unselectedColor;

  /// Whether this item is currently selected
  bool get isSelected => _isSelected;
  final bool _isSelected;

  /// Callback function when this item is tapped
  final VoidCallback? onTap;

  const NavItem({
    required this.icon,
    required this.label,
    this.badgeCount,
    this.badgeStyle,
    this.selectedColor,
    this.unselectedColor,
    this.onTap,
    bool isSelected = false,
  }) : _isSelected = isSelected;

  /// Creates a copy of this NavItem with updated properties
  NavItem copyWith({
    IconData? icon,
    String? label,
    int? badgeCount,
    BadgeStyle? badgeStyle,
    Color? selectedColor,
    Color? unselectedColor,
    VoidCallback? onTap,
    bool? isSelected,
  }) {
    return NavItem(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      badgeCount: badgeCount ?? this.badgeCount,
      badgeStyle: badgeStyle ?? this.badgeStyle,
      selectedColor: selectedColor ?? this.selectedColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      onTap: onTap ?? this.onTap,
      isSelected: isSelected ?? this._isSelected,
    );
  }
}
