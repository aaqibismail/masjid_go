import 'package:flutter/material.dart' hide Route;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/src/background_gradient.dart';
import 'package:masjid_go/src/masjid_stops/masjid_info_tile.dart';
import 'package:masjid_go/src/providers.dart';

class MasjidStops extends ConsumerWidget {
  final Route route;
  const MasjidStops({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(masjidsProvider(route));

    return BackgroundGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xFF152834),
          elevation: 0,
          title: Text(
            'Settings',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                color: const Color(0xFFF4CCA8), fontWeight: FontWeight.normal),
          ),
          centerTitle: true,
        ),
        body: result.when(
          data: (masjids) {
            return ListView.separated(
              itemCount: 0,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Dhuhr"),
                    ExpansionTile(
                      title: Text("Select A Masjid"),
                      children: [
                        MasjidInfoTile(),
                      ],
                    ),
                  ],
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => Center(child: Text("Error: $_")),
        ),
      ),
    );
  }
}
