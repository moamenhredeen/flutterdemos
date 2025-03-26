import 'package:demos/data/issue_status.dart';
import 'package:demos/ui/inbox/inbox_view_model.dart';
import 'package:demos/ui/widgets/issue_tile.dart';
import 'package:demos/ui/widgets/new_issue.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  final InboxViewModel _inboxViewModel;

  const InboxView({super.key, required InboxViewModel inboxViewModel})
    : _inboxViewModel = inboxViewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _inboxViewModel,
      builder:
          (context, _) => Scaffold(
            appBar: AppBar(title: Text("Inbox")),
            body: RefreshIndicator(
              onRefresh: () async {
                return await _inboxViewModel.getIssues();
              },
              child: ListView.builder(
                itemCount: _inboxViewModel.issues.length,
                itemBuilder: (context, index) {
                  final issue = _inboxViewModel.issues[index];
                  return IssueTile(
                    id: issue.id,
                    name: issue.name,
                    description: issue.description,
                    issueStatus: issue.status,
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (context) => NewIssue());
              },
              child: Icon(Icons.add),
            ),
          ),
    );
  }
}
