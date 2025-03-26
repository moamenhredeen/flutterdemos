import 'package:demos/data/issue_status.dart';
import 'package:flutter/material.dart';

class IssueTile extends StatelessWidget {
  final int _id;
  final String _name;
  final String _description;
  final IssueStatus _issueStatus;

  const IssueTile({
    super.key,
    required int id,
    required String name,
    required String description,
    required IssueStatus issueStatus,
  }) : _id = id,
       _name = name,
       _description = description,
       _issueStatus = issueStatus;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(_id),
      leading: switch (_issueStatus) {
        IssueStatus.todo => Icon(Icons.circle, color: Colors.red),
        IssueStatus.doing => Icon(
          Icons.arrow_forward_rounded,
          color: Colors.blue,
        ),
        IssueStatus.done => Icon(Icons.check, color: Colors.green),
      },
      title: Text(_name),
      subtitle: Text(_description),
      onTap: () {},
    );
  }
}
