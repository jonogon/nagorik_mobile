part of '../route_configuration.dart';

List<GoRoute> _authenticationRoutes = [
  GoRoute(
    path: Routes.login,
    name: Routes.login,
    pageBuilder: (context, state) => const MaterialPage(
      child: LoginScreen(),
    ),
    routes: [
      GoRoute(
        path: Routes.register,
        name: Routes.register,
        pageBuilder: (context, state) => const MaterialPage(
          child: RegisterScreen(),
        ),
      ),
    ],
  ),
];
