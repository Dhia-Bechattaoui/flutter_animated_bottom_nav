import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/badge_style.dart';
import 'models/nav_item.dart';
import 'models/nav_style.dart';
import 'widgets/nav_item_widget.dart';

/// A highly customizable animated bottom navigation bar with morphing icons,
/// badge support, and smooth transitions.
class AnimatedBottomNav extends StatefulWidget {
  /// List of navigation items to display
  final List<NavItem> items;

  /// Current selected index
  final int selectedIndex;

  /// Callback when a navigation item is selected
  final ValueChanged<int>? onItemSelected;

  /// Style configuration for the navigation bar
  final NavStyle style;

  /// Whether to enable haptic feedback on item selection
  final bool enableHapticFeedback;

  /// Custom builder for navigation items
  final Widget Function(NavItem item, int index, bool isSelected)? itemBuilder;

  AnimatedBottomNav({
    super.key,
    required this.items,
    required this.selectedIndex,
    this.onItemSelected,
    this.style = const NavStyle(),
    this.enableHapticFeedback = true,
    this.itemBuilder,
  })  : assert(items.isNotEmpty, 'Items list cannot be empty'),
        assert(selectedIndex >= 0 && selectedIndex < items.length,
            'Selected index must be within the range of items');

  @override
  State<AnimatedBottomNav> createState() => _AnimatedBottomNavState();
}

class _AnimatedBottomNavState extends State<AnimatedBottomNav>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.style.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.style.animationCurve,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.style.animationCurve,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTap(int index) {
    if (index == widget.selectedIndex) return;

    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    // Trigger animation
    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    widget.onItemSelected?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.style.margin,
      decoration: BoxDecoration(
        color: widget.style.backgroundColor,
        borderRadius: widget.style.borderRadius,
        boxShadow: [
          BoxShadow(
            color:
                widget.style.shadowColor ?? Colors.black.withValues(alpha: 0.1),
            blurRadius: widget.style.elevation,
            offset: const Offset(0, 2),
          ),
        ],
        border: widget.style.border,
      ),
      child: Container(
        height: widget.style.height,
        padding: widget.style.padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            widget.items.length,
            (index) {
              final item = widget.items[index];
              final isSelected = index == widget.selectedIndex;

              // Create updated item with selection state
              final updatedItem = item.copyWith(isSelected: isSelected);

              if (widget.itemBuilder != null) {
                return widget.itemBuilder!(updatedItem, index, isSelected);
              }

              return Expanded(
                child: NavItemWidget(
                  item: updatedItem,
                  index: index,
                  isSelected: isSelected,
                  style: widget.style,
                  onTap: () => _onItemTap(index),
                  scaleAnimation: isSelected ? _scaleAnimation : null,
                  fadeAnimation: _fadeAnimation,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Extension to provide convenient methods for creating navigation items
extension NavItemExtension on NavItem {
  /// Creates a NavItem with home icon
  static NavItem home({
    String label = 'Home',
    int? badgeCount,
    BadgeStyle? badgeStyle,
    Color? selectedColor,
    Color? unselectedColor,
    VoidCallback? onTap,
  }) {
    return NavItem(
      icon: Icons.home,
      label: label,
      badgeCount: badgeCount,
      badgeStyle: badgeStyle,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      onTap: onTap,
    );
  }

  /// Creates a NavItem with search icon
  static NavItem search({
    String label = 'Search',
    int? badgeCount,
    BadgeStyle? badgeStyle,
    Color? selectedColor,
    Color? unselectedColor,
    VoidCallback? onTap,
  }) {
    return NavItem(
      icon: Icons.search,
      label: label,
      badgeCount: badgeCount,
      badgeStyle: badgeStyle,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      onTap: onTap,
    );
  }

  /// Creates a NavItem with notifications icon
  static NavItem notifications({
    String label = 'Notifications',
    int? badgeCount,
    BadgeStyle? badgeStyle,
    Color? selectedColor,
    Color? unselectedColor,
    VoidCallback? onTap,
  }) {
    return NavItem(
      icon: Icons.notifications,
      label: label,
      badgeCount: badgeCount,
      badgeStyle: badgeStyle,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      onTap: onTap,
    );
  }

  /// Creates a NavItem with profile icon
  static NavItem profile({
    String label = 'Profile',
    int? badgeCount,
    BadgeStyle? badgeStyle,
    Color? selectedColor,
    Color? unselectedColor,
    VoidCallback? onTap,
  }) {
    return NavItem(
      icon: Icons.person,
      label: label,
      badgeCount: badgeCount,
      badgeStyle: badgeStyle,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      onTap: onTap,
    );
  }

  /// Creates a NavItem with settings icon
  static NavItem settings({
    String label = 'Settings',
    int? badgeCount,
    BadgeStyle? badgeStyle,
    Color? selectedColor,
    Color? unselectedColor,
    VoidCallback? onTap,
  }) {
    return NavItem(
      icon: Icons.settings,
      label: label,
      badgeCount: badgeCount,
      badgeStyle: badgeStyle,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      onTap: onTap,
    );
  }
}
