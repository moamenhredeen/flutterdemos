import 'dart:io';
import 'dart:math';

import 'package:demos/data/issue.dart';
import 'package:demos/data/issue_repository_contract.dart';
import 'package:demos/data/issue_status.dart';

class IssueRepository implements IssueRepositoryContract {
  final _random = Random();
  
  final List<Issue> _issues = [
    Issue(
      id: 1,
      name: "first issue",
      description: "first issue description",
      status: IssueStatus.todo,
    ),
    Issue(
      id: 2,
      name: "second issue",
      description: "second issue description",
      status: IssueStatus.doing,
    ),
    Issue(
      id: 3,
      name: "third issue",
      description: "third issue description",
      status: IssueStatus.doing,
    ),
    Issue(
      id: 4,
      name: "fourth issue",
      description: "fourth issue description",
      status: IssueStatus.done,
    ),
  ];

  @override
  Future<List<Issue>> getIssues() async {
    await _randomDelay();
    return _issues.toList();
  }

  @override
  Future<List<Issue>> filter({String? name, Set<IssueStatus>? status}) async {
    await _randomDelay();
    if ((name == null || name.isEmpty) && status == null) return [];
    return _issues.where((e) {
      var take = false;
      if (name != null && name.isNotEmpty) {
        take = e.name.toLowerCase().contains(name.trim().toLowerCase());
      }
      if (status != null && status.isNotEmpty) {
        take = status.contains(e.status);
      }
      return take;
    }).toList();
  }

  Future<void> _randomDelay() async {
    await Future.delayed(Duration(milliseconds: _random.nextInt(1000)));
  }
}
