import 'package:demos/data/issue.dart';
import 'package:demos/data/issue_status.dart';

abstract interface class IssueRepositoryContract {
  Future<List<Issue>> getIssues();
  Future<List<Issue>> filter({String? name, Set<IssueStatus>? status});
}
