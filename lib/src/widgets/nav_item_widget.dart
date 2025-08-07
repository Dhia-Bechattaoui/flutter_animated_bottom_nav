import 'package:flutter/material.dart';
import '../models/nav_item.dart';
import '../models/nav_style.dart';
import 'morphing_icon.dart';
import 'badge_widget.dart';

/// Widget for displaying individual navigation items with animations
class NavItemWidget extends StatefulWidget {
  final NavItem item;
  final int index;
  final bool isSelected;
  final NavStyle style;
  final VoidCallback onTap;
  final Animation<double>? scaleAnimation;
  final Animation<double> fadeAnimation;

  const NavItemWidget({
    super.key,
    required this.item,
    required this.index,
    required this.isSelected,
    required this.style,
    required this.onTap,
    this.scaleAnimation,
    required this.fadeAnimation,
  });

  @override
  State<NavItemWidget> createState() => _NavItemWidgetState();
}

class _NavItemWidgetState extends State<NavItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _labelOpacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.style.animationDuration,
      vsync: this,
    );

    _iconScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _labelOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    if (widget.isSelected) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(NavItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemColor = widget.isSelected
        ? (widget.item.selectedColor ?? widget.style.selectedColor)
        : (widget.item.unselectedColor ?? widget.style.unselectedColor);

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration:
                widget.style.showSelectedItemBackground && widget.isSelected
                    ? BoxDecoration(
                        color: widget.style.selectedItemBackgroundColor ??
                            itemColor.withValues(alpha: 0.1),
                        borderRadius: widget.style.selectedItemBorderRadius,
                      )
                    : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon with morphing animation
                Transform.scale(
                  scale: widget.isSelected ? _iconScaleAnimation.value : 1.0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      MorphingIcon(
                        icon: widget.item.icon,
                        isSelected: widget.isSelected,
                        color: itemColor,
                        size: widget.style.iconSize,
                        animationDuration: widget.style.animationDuration,
                        animationCurve: widget.style.animationCurve,
                      ),
                      // Badge
                      if (widget.item.badgeCount != null &&
                          (widget.item.badgeCount! > 0 ||
                              (widget.item.badgeStyle?.showZero ??
                                  widget.style.defaultBadgeStyle.showZero)))
                        Positioned(
                          top: -2,
                          right: -2,
                          child: BadgeWidget(
                            count: widget.item.badgeCount!,
                            style: widget.item.badgeStyle ??
                                widget.style.defaultBadgeStyle,
                          ),
                        ),
                    ],
                  ),
                ),

                // Label
                if (widget.style.showLabels) ...[
                  SizedBox(height: widget.style.iconLabelSpacing),
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _labelOpacityAnimation,
                      child: Text(
                        widget.item.label,
                        style: TextStyle(
                          color: itemColor,
                          fontSize: widget.style.labelFontSize,
                          fontWeight: widget.style.labelFontWeight,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
