import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagorik_mobile/src/core/services/navigation/router_state/router_state.dart';

final routerStateNotifier = ChangeNotifierProvider<_RouterStateNotifier>((ref) {
  return _RouterStateNotifier();
});

class _RouterStateNotifier extends ChangeNotifier {
  RouterState state = RouterState();

  void updateSplashStatus(bool hasCompletedSplash) {
    state.updateSplashStatus(hasCompletedSplash);
    notifyListeners();
  }

  void updateOnboardingStatus(bool hasCompletedOnboarding) {
    state.updateOnboardingStatus(hasCompletedOnboarding);
    notifyListeners();
  }
}
