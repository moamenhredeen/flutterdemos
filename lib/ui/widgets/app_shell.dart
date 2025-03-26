import 'package:demos/ui/widgets/app_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final Widget _child;
  const AppShell({super.key, required Widget child}) : _child = child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _child, bottomNavigationBar: AppNavigationBar());
  }
}
