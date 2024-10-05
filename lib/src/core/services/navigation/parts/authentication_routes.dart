part of '../route_configuration.dart';

List<GoRoute> _authenticationRoutes = [
  GoRoute(
    path: Routes.login,
    name: Routes.login,
    pageBuilder: (context, state) => const MaterialPage(
      child: LoginScreen(),
    ),
  ),
];
