import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/gen/assets.gen.dart';
import 'package:masjid_go/src/home/home_notifier.dart';
import 'package:masjid_go/src/location_search.dart';
import 'package:masjid_go/src/models/google_place/google_place.dart';
import 'package:masjid_go/src/providers.dart';
import 'package:masjid_go/src/router.gr.dart';
import 'package:quick_actions/quick_actions.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  static const quickActions = QuickActions();

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      quickActions.initialize((shortcutType) {
        if (shortcutType == 'action_main') {}
        // More handling code...
      });
      quickActions.setShortcutItems(const <ShortcutItem>[
        ShortcutItem(
          type: 'action_main',
          localizedTitle: 'Main view',
          // icon: 'icon_main',
        ),
        ShortcutItem(
          type: 'action_help',
          localizedTitle: 'Help',
          // icon: 'icon_help',
        )
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final showSearchButton = ref.watch(homeNotifierProvider).maybeWhen(
          data: (value) =>
              value.destinationPlaceId != null &&
              (value.startPlaceId != null || value.currentLoc != null),
          orElse: () => false,
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.grey.shade700,
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.homescreen,
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.settings),
              onPressed: () => AutoRouter.of(context).push(const Settings()),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const _LocationField(searchType: SearchType.start),
              const _LocationField(searchType: SearchType.destination),
              const SizedBox(height: 8),
              Visibility(
                visible: showSearchButton,
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(homeNotifierProvider).whenData((value) async {
                      if (value.startPlaceId != null &&
                          value.destinationPlaceId != null) {
                        AutoRouter.of(context).push(MapRoutes(
                          origin: value.startPlaceId,
                          destination: value.destinationPlaceId,
                        ));
                      } else if (value.currentLoc != null &&
                          value.destinationPlaceId != null) {
                        final loc = await ref
                            .read(mapRepoProvider)
                            .getPlaceIdFromLoc(value.currentLoc!);

                        AutoRouter.of(context).push(MapRoutes(
                          origin: loc,
                          destination: value.destinationPlaceId,
                        ));
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Search"),
                      SizedBox(width: 8),
                      Icon(CupertinoIcons.arrow_2_circlepath)
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationField extends HookConsumerWidget {
  final SearchType searchType;
  const _LocationField({Key? key, required this.searchType}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initial = ref.watch(homeNotifierProvider.select((state) {
      return state.maybeWhen(
        data: (value) => searchType == SearchType.start
            ? value.startName
            : value.destinationName,
        orElse: () => null,
      );
    }));

    return GestureDetector(
      onTap: () => onTap(context, ref, searchType),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Text(
          initial ?? describeEnum(searchType),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void onTap(BuildContext context, WidgetRef ref, SearchType type) {
    ref.read(homeNotifierProvider).whenData((value) async {
      final place = await showSearch(
        context: context,
        delegate: LocationSearch(
          locationSearchNotifer: ref.read(locationSearchProvider.notifier),
          loc: value.currentLoc,
        ),
      ) as GooglePlace?;
      if (place != null) {
        if (searchType == SearchType.start) {
          ref.read(homeNotifierProvider.notifier).update(
                startName: place.fullText,
                startPlaceId: place.placeId,
              );
        } else if (searchType == SearchType.destination) {
          ref.read(homeNotifierProvider.notifier).update(
                destinationName: place.fullText,
                destinationPlaceId: place.placeId,
              );
        }
      }
    });
  }
}
