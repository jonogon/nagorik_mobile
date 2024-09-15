class RouterState {
  bool hasCompletedSplash = false;
  bool hasCompletedOnboarding = false;

  void updateSplashStatus(bool hasCompletedSplash) {
    this.hasCompletedSplash = hasCompletedSplash;
  }

  void updateOnboardingStatus(bool hasCompletedOnboarding) {
    this.hasCompletedOnboarding = hasCompletedOnboarding;
  }
}
