import 'package:demos/ui/inbox/inbox_view_model.dart';
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
            appBar: AppBar(title: Text("Inbox"), backgroundColor: Colors.amber),
            body: RefreshIndicator(
              onRefresh: () async {
                return await _inboxViewModel.getIssues();
              },
              child: ListView.builder(
                itemCount: _inboxViewModel.issues.length,
                itemBuilder:
                    (context, index) => ListTile(
                      key: ValueKey(_inboxViewModel.issues[index].id),
                      leading: Text(
                        _inboxViewModel.issues[index].id.toString(),
                      ),
                      title: Text(_inboxViewModel.issues[index].name),
                      subtitle: Text(_inboxViewModel.issues[index].description),
                      onTap: () {
                        if (kDebugMode) {
                          print("aösldkfjöaslkdfj");
                        }
                      },
                    ),
              ),
            ),
          ),
    );
  }
}
