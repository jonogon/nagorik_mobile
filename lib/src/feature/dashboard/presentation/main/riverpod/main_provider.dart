import 'package:nagorik_mobile/src/feature/dashboard/data/local/model/Event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/main_entity.dart';

part 'main_provider.g.dart';

final events = [
  const Event(
      title: "Event 1",
      image: "",
      description:
          "Donec blandit ultricies sollicitudin non. Molestie proin faucibus turpis nisi ac. A nibh massa ultricies mauris tellus odio sed rhoncus consectetur. Enim adipiscing sodales praesent cras. Dignissim in neque duis at..."),
  const Event(
      title: "Event 2",
      image: "",
      description:
          "Vestibulum sed ultricies volutpat eu gravida ac pulvinar. Pellentesque adipiscing commodo nibh ultrices."),
  const Event(
      title: "Event 3",
      image: "",
      description:
          "Donec blandit ultricies sollicitudin non. Molestie proin faucibus turpis nisi ac. A nibh massa ultricies mauris tellus odio sed rhoncus consectetur. Enim adipiscing sodales praesent cras. Dignissim in neque duis at...")
];

@riverpod
class Main extends _$Main {
  @override
  FutureOr<TabEntity?> build() async {
    return null;
  }

  void tabChanged(int index) {
    state = AsyncData(TabEntity(index: index));
  }
}

@riverpod
List<Event> getEvents(ref) {
  return events;
}
