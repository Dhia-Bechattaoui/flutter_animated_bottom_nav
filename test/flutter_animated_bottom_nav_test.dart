import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_animated_bottom_nav/flutter_animated_bottom_nav.dart';

void main() {
  group('AnimatedBottomNav Tests', () {
    testWidgets('should render navigation items correctly',
        (WidgetTester tester) async {
      final List<NavItem> items = [
        NavItem(icon: Icons.home, label: 'Home'),
        NavItem(icon: Icons.search, label: 'Search'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AnimatedBottomNav(
              items: items,
              selectedIndex: 0,
              onItemSelected: (index) {},
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should handle item selection', (WidgetTester tester) async {
      int selectedIndex = 0;
      final List<NavItem> items = [
        NavItem(icon: Icons.home, label: 'Home'),
        NavItem(icon: Icons.search, label: 'Search'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AnimatedBottomNav(
              items: items,
              selectedIndex: selectedIndex,
              onItemSelected: (index) {
                selectedIndex = index;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pump();

      expect(selectedIndex, equals(1));
    });

    testWidgets('should display badges correctly', (WidgetTester tester) async {
      final List<NavItem> items = [
        NavItem(
          icon: Icons.home,
          label: 'Home',
          badgeCount: 3,
          badgeStyle: const BadgeStyle(
            backgroundColor: Colors.red,
            textColor: Colors.white,
          ),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AnimatedBottomNav(
              items: items,
              selectedIndex: 0,
              onItemSelected: (index) {},
            ),
          ),
        ),
      );

      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('should apply custom styling', (WidgetTester tester) async {
      final List<NavItem> items = [
        NavItem(icon: Icons.home, label: 'Home'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AnimatedBottomNav(
              items: items,
              selectedIndex: 0,
              onItemSelected: (index) {},
              style: const NavStyle(
                backgroundColor: Colors.black,
                selectedColor: Colors.white,
                unselectedColor: Colors.grey,
                height: 100,
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.byType(Container).first,
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.black));
    });

    testWidgets('should use factory methods correctly',
        (WidgetTester tester) async {
      final List<NavItem> items = [
        NavItemExtension.home(badgeCount: 5),
        NavItemExtension.search(),
        NavItemExtension.notifications(badgeCount: 10),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AnimatedBottomNav(
              items: items,
              selectedIndex: 0,
              onItemSelected: (index) {},
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('10'), findsOneWidget);
    });
  });

  group('NavItem Tests', () {
    test('should create NavItem with required properties', () {
      final item = NavItem(
        icon: Icons.home,
        label: 'Home',
      );

      expect(item.icon, equals(Icons.home));
      expect(item.label, equals('Home'));
      expect(item.badgeCount, isNull);
      expect(item.isSelected, isFalse);
    });

    test('should update selected state', () {
      final item = NavItem(
        icon: Icons.home,
        label: 'Home',
      );

      final selectedItem = item.copyWith(isSelected: true);
      expect(selectedItem.isSelected, isTrue);

      final unselectedItem = item.copyWith(isSelected: false);
      expect(unselectedItem.isSelected, isFalse);
    });

    test('should create copy with updated properties', () {
      final item = NavItem(
        icon: Icons.home,
        label: 'Home',
      );

      final copy = item.copyWith(
        label: 'Dashboard',
        badgeCount: 5,
        isSelected: true,
      );

      expect(copy.icon, equals(Icons.home));
      expect(copy.label, equals('Dashboard'));
      expect(copy.badgeCount, equals(5));
      expect(copy.isSelected, isTrue);
    });
  });

  group('NavStyle Tests', () {
    test('should create NavStyle with default values', () {
      const style = NavStyle();

      expect(style.backgroundColor, equals(Colors.white));
      expect(style.selectedColor, equals(Colors.blue));
      expect(style.unselectedColor, equals(Colors.grey));
      expect(style.height, equals(80.0));
      expect(style.elevation, equals(8.0));
      expect(style.showLabels, isTrue);
    });

    test('should create copy with updated properties', () {
      const style = NavStyle();
      final copy = style.copyWith(
        backgroundColor: Colors.black,
        selectedColor: Colors.white,
        height: 100.0,
      );

      expect(copy.backgroundColor, equals(Colors.black));
      expect(copy.selectedColor, equals(Colors.white));
      expect(copy.height, equals(100.0));
      expect(copy.unselectedColor, equals(Colors.grey)); // unchanged
    });
  });

  group('BadgeStyle Tests', () {
    test('should create BadgeStyle with default values', () {
      const style = BadgeStyle();

      expect(style.backgroundColor, equals(Colors.red));
      expect(style.textColor, equals(Colors.white));
      expect(style.borderWidth, equals(0.0));
      expect(style.fontSize, equals(12.0));
      expect(style.showZero, isFalse);
    });

    test('should create copy with updated properties', () {
      const style = BadgeStyle();
      final copy = style.copyWith(
        backgroundColor: Colors.blue,
        fontSize: 16.0,
        showZero: true,
      );

      expect(copy.backgroundColor, equals(Colors.blue));
      expect(copy.fontSize, equals(16.0));
      expect(copy.showZero, isTrue);
      expect(copy.textColor, equals(Colors.white)); // unchanged
    });
  });
}
