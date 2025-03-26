import 'package:demos/data/issue.dart';

abstract interface class IssueRepository {
  Future<List<Issue>> getIssues();
}
