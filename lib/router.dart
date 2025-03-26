import 'package:demos/ui/inbox_screen.dart';
import 'package:demos/ui/preferences_view.dart';
import 'package:demos/ui/search_view.dart';
import 'package:demos/ui/widgets/app_shell.dart';
import 'package:go_router/go_router.dart';


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
              (context, state) => InboxScreen(),
        ),
        GoRoute(
          path: "/search",
          builder:
              (context, state) => SearchView(),
        ),
        GoRoute(
          path: "/settings",
          builder: (context, state) => PreferencesView(),
        ),
      ],
    ),
  ],
);
