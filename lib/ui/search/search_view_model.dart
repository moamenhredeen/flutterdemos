import 'package:demos/data/issue.dart';
import 'package:demos/data/issue_repository_contract.dart';
import 'package:demos/data/issue_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchViewModel extends ChangeNotifier {
  // state
  List<Issue> issues = [];
  Set<IssueStatus> statusFilter = {};

  final TextEditingController searchController = TextEditingController();

  // deps
  final IssueRepositoryContract _issueRepository;

  SearchViewModel({required IssueRepositoryContract issueRepository})
    : _issueRepository = issueRepository {
    searchController.addListener(() async {
      filterIssues(searchController.text);
    });
  }

  Future<void> filterIssues(String word) async {
    issues = await _issueRepository.filter(name: word, status: statusFilter);
    notifyListeners();
  }

  get todoFilter => statusFilter.contains(IssueStatus.todo);
  get doingFilter => statusFilter.contains(IssueStatus.doing);
  get doneFilter => statusFilter.contains(IssueStatus.done);

  void toggleFilter(IssueStatus status) {
    if (statusFilter.contains(status)) {
      statusFilter.remove(status);
    } else {
      statusFilter.add(status);
    }
    filterIssues(searchController.text);
    notifyListeners();
  }
}
