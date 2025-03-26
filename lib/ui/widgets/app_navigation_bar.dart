import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _index,
      onDestinationSelected: (value) {
        setState(() {
          _index = value;
        });
        final url = switch (value) {
          0 => "/inbox",
          1 => "/search",
          2 => "/settings",
          _ => "/inbox",
        };
        context.go(url);
      },
      destinations: [
        NavigationDestination(icon: Badge(child: Icon(Icons.inbox), label: Text("10"),), label: "Inbox"),
        NavigationDestination(icon: Icon(Icons.search), label: "Search"),
        NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
