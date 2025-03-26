import 'package:demos/providers/issue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppNavigationBar extends ConsumerStatefulWidget {
  const AppNavigationBar({super.key});

  @override
  ConsumerState<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends ConsumerState<AppNavigationBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {

    final count = ref.watch(issueProvider).value?.length ?? 0;

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
        NavigationDestination(icon: Badge(child: Icon(Icons.inbox), label: Text(count.toString()),), label: "Inbox"),
        NavigationDestination(icon: Icon(Icons.search), label: "Search"),
        NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
