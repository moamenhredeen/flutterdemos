import 'dart:ffi';

import 'package:demos/data/issue_status.dart';
import 'package:demos/ui/search/search_view_model.dart';
import 'package:demos/ui/widgets/issue_tile.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  final SearchViewModel _searchViewModel;

  const SearchView({super.key, required SearchViewModel searchViewModel})
    : _searchViewModel = searchViewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _searchViewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: Text("Search"), backgroundColor: Colors.amber),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: TextField(
                  controller: _searchViewModel.searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: true,
                    fillColor: Colors.black12,
                    hintText: "Search for Issue",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Wrap(
                  spacing: 10,
                  children: [
                    FilterChip(
                      label: Text("Todo"),
                      selected: _searchViewModel.todoFilter,
                      onSelected: (selected) {
                        _searchViewModel.toggleFilter(IssueStatus.todo);
                      },
                    ),
                    FilterChip(
                      label: Text("Doing"),
                      selected: _searchViewModel.doingFilter,
                      onSelected: (selected) {
                        _searchViewModel.toggleFilter(IssueStatus.doing);
                      },
                    ),
                    FilterChip(
                      label: Text("Done"),
                      selected: _searchViewModel.doneFilter,
                      onSelected: (selected) {
                        _searchViewModel.toggleFilter(IssueStatus.done);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchViewModel.issues.length,
                  itemBuilder: (context, index) {
                    final issue = _searchViewModel.issues[index];
                    return IssueTile(
                      id: issue.id,
                      name: issue.name,
                      description: issue.description,
                      issueStatus: issue.status,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
