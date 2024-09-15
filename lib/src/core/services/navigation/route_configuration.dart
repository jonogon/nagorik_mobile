import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nagorik_mobile/src/core/services/navigation/router_state/router_state_notifer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../feature/authentication/presentation/login/views/login_screen.dart';
import '../../../feature/authentication/presentation/register/views/register_screen.dart';
import '../../../feature/onboarding/presentation/splash/views/splash_screen.dart';
import 'routes.dart';

part './parts/authentication_routes.dart';
part 'route_configuration.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Root');

@riverpod
GoRouter router(RouterRef ref) {
  final listenable = ref.watch(routerStateNotifier);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: Routes.splash,
    refreshListenable: listenable,
    redirect: (context, state) async {
      /// If the user has completed the splash screen, redirect to the login screen
      if (listenable.state.hasCompletedSplash) return Routes.login;

      return null;
    },
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splash,
        pageBuilder: (context, state) {
          Timer(
            const Duration(seconds: 1),
            () => listenable.updateSplashStatus(true),
          );
          return const MaterialPage(child: SplashScreen());
        },
      ),
      ..._authenticationRoutes,
    ],
  );
}
