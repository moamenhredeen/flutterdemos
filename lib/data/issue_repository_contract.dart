import 'package:demos/data/issue.dart';

abstract interface class IssueRepositoryContract {
  Future<List<Issue>> getIssues();
}
