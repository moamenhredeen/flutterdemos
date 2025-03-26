import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inbox"), backgroundColor: Colors.amber),
      body: Center(child: Text("Inbox Page")),
    );
  }
}
