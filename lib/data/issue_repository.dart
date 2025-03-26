import 'package:demos/data/issue.dart';
import 'package:demos/data/issue_repository_contract.dart';
import 'package:demos/data/issue_status.dart';

class IssueRepository implements IssueRepositoryContract {
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
    await Future.delayed(Duration(seconds: 1));
    return _issues.toList();
  }
}
