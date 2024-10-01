import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagorik_mobile/src/core/gen/assets.gen.dart';
import 'package:nagorik_mobile/src/feature/dashboard/presentation/main/widgets/home.dart';

import '../riverpod/main_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainProvider);
    final notifier = ref.watch(mainProvider.notifier);
    final events = ref.watch(getEventsProvider);

    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            notifier.tabChanged(index);
          },
          selectedIndex: state.value?.index ?? 0,
          height: 56,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Assets.icons.homeIconSelected.svg(),
              icon: Assets.icons.homeIcon.svg(),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Assets.icons.mapIconSelected.svg(),
              icon: Assets.icons.mapIcon.svg(),
              label: 'Map',
            ),
            NavigationDestination(
              icon: Assets.icons.addIcon.svg(),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Assets.icons.notificationIconSelected.svg(),
              icon: Assets.icons.notificationIcon.svg(),
              label: 'News',
            ),
            NavigationDestination(
              selectedIcon: Assets.icons.profileIconSelected.svg(),
              icon: Assets.icons.profileIcon.svg(),
              label: 'Profile',
            ),
          ],
        ),
        body: SafeArea(child: Home(events: events)));
  }
}
