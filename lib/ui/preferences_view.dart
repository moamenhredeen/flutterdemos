import 'package:flutter/material.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preferences")),
      body: Center(child: Text("Preferences")),
    );
  }
}
