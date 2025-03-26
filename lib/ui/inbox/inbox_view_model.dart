import 'package:demos/data/issue.dart';
import 'package:demos/data/issue_repository_contract.dart';
import 'package:flutter/material.dart';

class InboxViewModel extends ChangeNotifier {
  // state
  List<Issue> issues = [];

  // deps
  final IssueRepositoryContract _issueRepository;

  InboxViewModel({required IssueRepositoryContract issueRepository})
    : _issueRepository = issueRepository {
    getIssues();
  }

  Future<void> getIssues() async {
    issues = await _issueRepository.getIssues();
    print(issues);
    notifyListeners();
  }
}
