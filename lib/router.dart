import 'package:demos/data/issue_repository.dart';
import 'package:demos/data/issue_repository_contract.dart';
import 'package:demos/ui/inbox/inbox_view.dart';
import 'package:demos/ui/inbox/inbox_view_model.dart';
import 'package:demos/ui/preferences/preferences_view.dart';
import 'package:demos/ui/search/search_view.dart';
import 'package:demos/ui/search/search_view_model.dart';
import 'package:demos/ui/widgets/app_shell.dart';
import 'package:go_router/go_router.dart';

// repos
final IssueRepositoryContract _issueRepository = IssueRepository();

// viewModels
final InboxViewModel _inboxViewModel = InboxViewModel(
  issueRepository: _issueRepository,
);

final SearchViewModel _searchViewModel = SearchViewModel(
  issueRepository: _issueRepository,
);

final router = GoRouter(
  initialLocation: "/inbox",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: "/inbox",
          builder:
              (context, state) => InboxView(inboxViewModel: _inboxViewModel),
        ),
        GoRoute(
          path: "/search",
          builder:
              (context, state) => SearchView(searchViewModel: _searchViewModel),
        ),
        GoRoute(
          path: "/settings",
          builder: (context, state) => PreferencesView(),
        ),
      ],
    ),
  ],
);
