import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mangayomi/views/browse/browse_screen.dart';
import 'package:mangayomi/views/general/general_screen.dart';
import 'package:mangayomi/views/history/history_screen.dart';
import 'package:mangayomi/views/library/library_screen.dart';
import 'package:mangayomi/views/more/more_screen.dart';
import 'package:mangayomi/views/updates/updates_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = AsyncRouterNotifier();

  return GoRouter(
    initialLocation: '/library',
    debugLogDiagnostics: false,
    refreshListenable: router,
    routes: router._routes,
  );
});

class AsyncRouterNotifier extends ChangeNotifier {
  List<RouteBase> get _routes => [
        ShellRoute(
            builder: (context, state, child) => GeneralScreen(child: child),
            routes: [
              GoRoute(
                name: "library",
                path: '/library',
                builder: (context, state) => const LibraryScreen(),
                pageBuilder: (context, state) => CustomTransition(
                  key: state.pageKey,
                  child: const LibraryScreen(),
                ),
              ),
              GoRoute(
                name: "updates",
                path: '/updates',
                builder: (context, state) => const UpdatesScreen(),
                pageBuilder: (context, state) => CustomTransition(
                  key: state.pageKey,
                  child: const UpdatesScreen(),
                ),
              ),
              GoRoute(
                name: "history",
                path: '/history',
                builder: (context, state) => const HistoryScreen(),
                pageBuilder: (context, state) => CustomTransition(
                  key: state.pageKey,
                  child: const HistoryScreen(),
                ),
              ),
              GoRoute(
                name: "browse",
                path: '/browse',
                builder: (context, state) => const BrowseScreen(),
                pageBuilder: (context, state) => CustomTransition(
                  key: state.pageKey,
                  child: const BrowseScreen(),
                ),
              ),
              GoRoute(
                name: "more",
                path: '/more',
                builder: (context, state) => const MoreScreen(),
                pageBuilder: (context, state) => CustomTransition(
                  key: state.pageKey,
                  child: const MoreScreen(),
                ),
              ),
            ]),
      ];
}

class CustomTransition extends CustomTransitionPage {
  CustomTransition({required LocalKey key, required Widget child})
      : super(
          key: key,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: child,
        );
}