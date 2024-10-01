import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nagorik_mobile/src/core/gen/assets.gen.dart';
import 'package:nagorik_mobile/src/feature/dashboard/data/local/model/Event.dart';

class Home extends ConsumerWidget {
  const Home({super.key, required this.events});

  final List<Event> events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: events.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final width = MediaQuery.of(context).size.width;
          final imageHeight = width * 9 / 16;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(events[index].title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0C0F0E))),
                const SizedBox(height: 10),
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Color(0xFFF4F6F5)),
                    height: imageHeight,
                    width: width,
                    child: Assets.icons.imageIcon.svg(fit: BoxFit.none)),
                const SizedBox(height: 10),
                Text(events[index].description,
                    style: const TextStyle(
                        fontSize: 18, color: Color(0xFF444B49))),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Assets.icons.downRightFlowIcon.svg(),
                    const SizedBox(width: 10),
                    Assets.icons.bubbleChatIcon.svg(),
                    const SizedBox(width: 10),
                    Assets.icons.infoCircleIcon.svg()
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        });
  }
}
