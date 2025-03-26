import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search"), backgroundColor: Colors.amber),
      body: Center(child: Text("Search Page")),
    );
  }
}
