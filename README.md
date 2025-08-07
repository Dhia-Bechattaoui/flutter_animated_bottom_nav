# Flutter Animated Bottom Navigation

A highly customizable animated bottom navigation bar for Flutter with morphing icons, badge support, and smooth transitions.

## Features

✨ **Morphing Icons**: Smooth icon transitions with scale, rotation, and bounce animations  
🎯 **Badge Support**: Customizable badges with count display and styling  
🎨 **Highly Customizable**: Extensive styling options for colors, animations, and layout  
⚡ **Smooth Animations**: Configurable animation duration and curves  
📱 **Haptic Feedback**: Optional haptic feedback on item selection  
🔧 **Easy to Use**: Simple API with convenient factory methods  

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_animated_bottom_nav: ^0.0.3
```

## Quick Start

```dart
import 'package:flutter/material.dart';
import 'package:flutter_animated_bottom_nav/flutter_animated_bottom_nav.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItemExtension.home(badgeCount: 3),
    NavItemExtension.search(),
    NavItemExtension.notifications(badgeCount: 12),
    NavItemExtension.profile(),
    NavItemExtension.settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          SearchPage(),
          NotificationsPage(),
          ProfilePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNav(
        items: _navItems,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
```

## Usage

### Basic Usage

```dart
AnimatedBottomNav(
  items: [
    NavItem(
      icon: Icons.home,
      label: 'Home',
    ),
    NavItem(
      icon: Icons.search,
      label: 'Search',
    ),
  ],
  selectedIndex: 0,
  onItemSelected: (index) {
    // Handle item selection
  },
)
```

### With Badges

```dart
AnimatedBottomNav(
  items: [
    NavItem(
      icon: Icons.home,
      label: 'Home',
      badgeCount: 3,
      badgeStyle: BadgeStyle(
        backgroundColor: Colors.red,
        textColor: Colors.white,
      ),
    ),
    NavItem(
      icon: Icons.notifications,
      label: 'Notifications',
      badgeCount: 12,
      badgeStyle: BadgeStyle(
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        showZero: true,
      ),
    ),
  ],
  selectedIndex: 0,
  onItemSelected: (index) {
    // Handle item selection
  },
)
```

### Custom Styling

```dart
AnimatedBottomNav(
  items: _navItems,
  selectedIndex: _selectedIndex,
  onItemSelected: (index) {
    setState(() {
      _selectedIndex = index;
    });
  },
  style: NavStyle(
    backgroundColor: Colors.white,
    selectedColor: Colors.blue,
    unselectedColor: Colors.grey,
    selectedItemBackgroundColor: Color(0xFFE3F2FD),
    height: 80,
    elevation: 8,
    borderRadius: BorderRadius.circular(20),
    animationDuration: Duration(milliseconds: 300),
    animationCurve: Curves.easeInOut,
    showLabels: true,
    showSelectedItemBackground: true,
    iconSize: 24,
    labelFontSize: 12,
    labelFontWeight: FontWeight.w500,
  ),
)
```

### Using Factory Methods

```dart
final List<NavItem> _navItems = [
  NavItemExtension.home(
    badgeCount: 3,
    badgeStyle: BadgeStyle(
      backgroundColor: Colors.red,
      textColor: Colors.white,
    ),
  ),
  NavItemExtension.search(),
  NavItemExtension.notifications(
    badgeCount: 12,
    badgeStyle: BadgeStyle(
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      showZero: true,
    ),
  ),
  NavItemExtension.profile(),
  NavItemExtension.settings(),
];
```

## API Reference

### AnimatedBottomNav

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `items` | `List<NavItem>` | Required | List of navigation items |
| `selectedIndex` | `int` | Required | Currently selected item index |
| `onItemSelected` | `ValueChanged<int>?` | null | Callback when item is selected |
| `style` | `NavStyle` | `NavStyle()` | Styling configuration |
| `enableHapticFeedback` | `bool` | `true` | Enable haptic feedback |
| `itemBuilder` | `Widget Function(NavItem, int, bool)?` | null | Custom item builder |

### NavItem

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `icon` | `IconData` | Required | Icon to display |
| `label` | `String` | Required | Label text |
| `badgeCount` | `int?` | null | Badge count to display |
| `badgeStyle` | `BadgeStyle?` | null | Custom badge styling |
| `selectedColor` | `Color?` | null | Color when selected |
| `unselectedColor` | `Color?` | null | Color when unselected |
| `onTap` | `VoidCallback?` | null | Custom tap callback |

### NavStyle

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `backgroundColor` | `Color` | `Colors.white` | Navigation bar background |
| `selectedColor` | `Color` | `Colors.blue` | Selected item color |
| `unselectedColor` | `Color` | `Colors.grey` | Unselected item color |
| `selectedItemBackgroundColor` | `Color?` | null | Selected item background |
| `height` | `double` | `80.0` | Navigation bar height |
| `elevation` | `double` | `8.0` | Shadow elevation |
| `borderRadius` | `BorderRadius` | `BorderRadius.circular(20)` | Corner radius |
| `animationDuration` | `Duration` | `300ms` | Animation duration |
| `animationCurve` | `Curve` | `Curves.easeInOut` | Animation curve |
| `showLabels` | `bool` | `true` | Show labels below icons |
| `showSelectedItemBackground` | `bool` | `true` | Show selected item background |
| `iconSize` | `double` | `24.0` | Icon size |
| `labelFontSize` | `double` | `12.0` | Label font size |
| `labelFontWeight` | `FontWeight` | `FontWeight.w500` | Label font weight |

### BadgeStyle

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `backgroundColor` | `Color` | `Colors.red` | Badge background color |
| `textColor` | `Color` | `Colors.white` | Badge text color |
| `borderColor` | `Color?` | null | Badge border color |
| `borderWidth` | `double` | `0.0` | Badge border width |
| `borderRadius` | `BorderRadius` | `BorderRadius.circular(10)` | Badge corner radius |
| `fontSize` | `double` | `12.0` | Badge font size |
| `fontWeight` | `FontWeight` | `FontWeight.bold` | Badge font weight |
| `padding` | `EdgeInsets` | `EdgeInsets.symmetric(horizontal: 6, vertical: 2)` | Badge padding |
| `minSize` | `Size?` | null | Minimum badge size |
| `maxSize` | `Size?` | null | Maximum badge size |
| `showZero` | `bool` | `false` | Show badge when count is 0 |

## Factory Methods

The package provides convenient factory methods for common navigation items:

- `NavItemExtension.home()` - Home icon
- `NavItemExtension.search()` - Search icon  
- `NavItemExtension.notifications()` - Notifications icon
- `NavItemExtension.profile()` - Profile icon
- `NavItemExtension.settings()` - Settings icon

Each factory method accepts optional parameters for customization:

```dart
NavItemExtension.home(
  label: 'Dashboard',
  badgeCount: 5,
  badgeStyle: BadgeStyle(backgroundColor: Colors.red),
  selectedColor: Colors.blue,
  unselectedColor: Colors.grey,
  onTap: () => print('Home tapped'),
)
```

## Examples

Check out the `example/` directory for a complete working example that demonstrates:

- Basic usage
- Badge support
- Custom styling
- Factory methods
- Multiple pages with IndexedStack

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 