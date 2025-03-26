import 'dart:ffi';

import 'package:demos/data/issue.dart';
import 'package:demos/data/issue_status.dart';
import 'package:demos/providers/issue.dart';
import 'package:demos/ui/widgets/issue_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends ConsumerStatefulWidget {

  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {

  late final TextEditingController _textEditingController;
  final Set<IssueStatus> _issueStatusFilter = {};

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      ref.refresh(filteredIssueProvider(_issueStatusFilter));
    });
  }

  @override
  Widget build(BuildContext context) {

    final issues = ref.watch(filteredIssueProvider(_issueStatusFilter));

    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
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
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Wrap(
              spacing: 10,
              children: [
                _chip("Todo", IssueStatus.todo),
                _chip("Doing", IssueStatus.doing),
                _chip("Done", IssueStatus.done),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: issues.valueOrNull?.length ?? 0,
              itemBuilder: (context, index) {
                final issue = (issues.valueOrNull ?? [])[index];
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
  }

  FilterChip _chip(String label, IssueStatus status) {
    return FilterChip(
      label: Text(label),
      selected: _issueStatusFilter.contains(status),
      onSelected: (selected) {
        setState(() {
          if (_issueStatusFilter.contains(status)){
            _issueStatusFilter.remove(status);
          } else {
            _issueStatusFilter.add(status);
          }
        });
        ref.refresh(filteredIssueProvider(_issueStatusFilter));
      },
    );
  }
}
