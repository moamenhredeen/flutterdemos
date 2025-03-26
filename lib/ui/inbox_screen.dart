import 'package:demos/providers/issue.dart';
import 'package:demos/ui/widgets/issue_tile.dart';
import 'package:demos/ui/widgets/new_issue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InboxScreen extends ConsumerWidget {

  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final issues = ref.watch(issueProvider);

    return Scaffold(
            appBar: AppBar(title: Text("Inbox")),
            body: RefreshIndicator(
              onRefresh: () async {
                return ref.refresh(issueProvider.future);
              },
              child: ListView.builder(
                itemCount: (issues.valueOrNull ?? []).length,
                itemBuilder: (context, index) {
                  
                  final issue = (issues.valueOrNull ?? [])[index];
                  print(issue.id);
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
          );
  }
}
