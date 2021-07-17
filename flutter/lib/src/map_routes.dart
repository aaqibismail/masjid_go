import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/src/map_routes/routes_notifier.dart';
import 'package:masjid_go/src/object_extensions.dart';
import 'package:masjid_go/src/providers.dart';
import 'package:masjid_go/src/router.gr.dart';

class MapRoutes extends StatelessWidget {
  final String? origin;
  final String? destination;

  const MapRoutes({
    Key? key,
    @PathParam('origin') this.origin,
    @PathParam('destination') this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isValid = origin != null && destination != null;

    return isValid
        ? _MapRoutes(origin: origin!, destination: destination!)
        : const Scaffold(body: Center(child: Text("Invalid Parameters")));
  }
}

class _MapRoutes extends ConsumerStatefulWidget {
  final String origin;
  final String destination;

  const _MapRoutes({
    Key? key,
    required this.origin,
    required this.destination,
  }) : super(key: key);

  @override
  ConsumerState<_MapRoutes> createState() => _MapRoutesState();
}

class _MapRoutesState extends ConsumerState<_MapRoutes> {
  late final GoogleMapController mapController;
  final pageController = PageController(viewportFraction: 0.9);
  bool trafficEnabled = true;

  @override
  void initState() {
    ref
        .read(routesNotifierProvider.notifier)
        .findRoute(widget.origin, widget.destination);
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final originLoc = ref.watch(routesNotifierProvider.select(
      (state) => state.maybeWhen(
        data: (value) => value.origin,
        orElse: () => null,
      ),
    ));

    final markers = ref.watch(routesNotifierProvider.select(
      (state) => state.maybeWhen(
        data: (value) => value.markers,
        orElse: () => <Marker>{},
      ),
    ));

    final polyline = ref.watch(routesNotifierProvider.select(
      (state) => state.maybeWhen(
        data: (value) => value.currPolyline,
        orElse: () => const <Polyline>{},
      ),
    ));

    final length = ref.watch(routesNotifierProvider.select(
      (state) => state.maybeWhen(
        data: (value) => value.polylines.length,
        orElse: () => 0,
      ),
    ));

    final polylineResult = ref.watch(routesNotifierProvider.select(
      (state) => state.maybeWhen(
        data: (value) => value.polylineResult,
        orElse: () => null,
      ),
    ));

    ref.listen<AsyncValue<RoutesState>>(
      routesNotifierProvider,
      (state) {
        state.whenData((value) {
          final bounds = value.polylineResult.routes[value.page].bounds;
          if (bounds != null) {
            mapController.animateCamera(CameraUpdate.newLatLngBounds(
              bounds.toLatLngBounds(),
              30,
            ));
          }
        });
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GoogleMap(
            markers: markers,
            polylines: polyline,
            trafficEnabled: trafficEnabled,
            zoomControlsEnabled: false,
            onMapCreated: (controller) => mapController = controller,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(-37, 122),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.85),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: const Alignment(0.9, 0),
                  child: _LocationButton(
                    onTap: () {
                      if (originLoc != null) {
                        mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(target: originLoc),
                          ),
                        );
                      }
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: length,
                    onPageChanged:
                        ref.read(routesNotifierProvider.notifier).newPage,
                    itemBuilder: (context, index) {
                      final route = polylineResult?.routes[index];
                      final durationString =
                          route?.legs[0].durationString ?? "";
                      final distanceString =
                          route?.legs[0].distanceString ?? "";

                      final endAddress = route?.legs[0].endAddress ?? "";

                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(0xD0FFFFFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                durationString,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                      color: const Color(0xFF3CC819),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Route to",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            color: const Color(0xFF424F5E),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      endAddress,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            color: const Color(0xFF424F5E),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                )),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: const Color(0xFFF5F5FF)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Masjid Stops",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button
                                          ?.copyWith(
                                            color: const Color(0xFF5F5AF7),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(width: 8),
                                    Chip(
                                      labelPadding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      backgroundColor: const Color(0xFF5F5AF7),
                                      label: Text(
                                        distanceString,
                                        style: Theme.of(context)
                                            .textTheme
                                            .button
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        if (route != null) {
                                          AutoRouter.of(context)
                                              .push(MasjidStops(route: route));
                                        }
                                      },
                                      icon: const Icon(Icons.navigate_next),
                                      label: const Text('Go'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blueAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const _CloseButton(),
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Material(
                color: Colors.white10,
                type: MaterialType.circle,
                child: InkWell(
                  onTap: () => setState(() => trafficEnabled = !trafficEnabled),
                  child: const SizedBox(
                    height: 56,
                    width: 56,
                    child: Icon(Icons.directions_car_sharp),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white10,
        type: MaterialType.circle,
        child: InkWell(
          onTap: () => AutoRouter.of(context).navigate(const Home()),
          child: const SizedBox(
            height: 56,
            width: 56,
            child: Icon(
              CupertinoIcons.clear_circled_solid,
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class _LocationButton extends StatelessWidget {
  const _LocationButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.purple.shade100,
      type: MaterialType.circle,
      child: InkWell(
        splashColor: Colors.purple,
        onTap: onTap,
        child: const SizedBox(
          width: 56,
          height: 56,
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }
}
