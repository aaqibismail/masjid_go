import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/src/map_routes/routes_notifier.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/object_extensions.dart';
import 'package:masjid_go/src/providers.dart';
import 'package:masjid_go/src/router.gr.dart';

class MapRoutes extends StatelessWidget {
  final String? origin;
  final String? originPlaceId;
  final String? destination;
  final String? destinationPlaceId;

  const MapRoutes({
    Key? key,
    @PathParam('origin') this.origin,
    @PathParam('originPlaceId') this.originPlaceId,
    @PathParam('destination') this.destination,
    @PathParam('destinationPlaceId') this.destinationPlaceId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final originLatLong = LatLong.fromString(origin);
    final destinationLatLong = LatLong.fromString(destination);

    final isValid = (originLatLong != null || originPlaceId != null) &&
        destinationLatLong != null &&
        destinationPlaceId != null;

    return isValid
        ? _MapRoutes(
            origin: originLatLong!,
            originPlaceId: originPlaceId,
            destination: destinationLatLong!,
            destinationPlaceId: destinationPlaceId!,
          )
        : Scaffold(
            appBar: AppBar(title: const Text('Error'), centerTitle: true),
            body: Center(
              child: Text(
                "Invalid Location",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          );
  }
}

class _MapRoutes extends ConsumerStatefulWidget {
  final LatLong origin;
  final String? originPlaceId;
  final LatLong destination;
  final String destinationPlaceId;

  const _MapRoutes({
    Key? key,
    required this.origin,
    required this.originPlaceId,
    required this.destination,
    required this.destinationPlaceId,
  }) : super(key: key);

  @override
  ConsumerState<_MapRoutes> createState() => _MapRoutesState();
}

class _MapRoutesState extends ConsumerState<_MapRoutes> {
  late final GoogleMapController mapController;
  late final Set<Marker> markers;
  late final CameraPosition initialCameraPosition;
  final pageController = PageController(viewportFraction: 0.9);

  bool trafficEnabled = true;

  @override
  void initState() {
    ref.read(routesNotifierProvider.notifier).findRoute(
          widget.destinationPlaceId,
          origin: widget.origin,
          originPlaceId: widget.originPlaceId,
        );

    initialCameraPosition = CameraPosition(target: widget.origin.toLatLng());

    markers = {
      Marker(
        markerId: const MarkerId("destination"),
        position: widget.destination.toLatLng(),
        infoWindow: const InfoWindow(
          title: 'Destination',
          // snippet: _destinationAddress,
        ),
        // icon: BitmapDescriptor.defaultMarker,
      ),
    };
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
    final polyline = ref.watch(
      routesNotifierProvider.select(
        (state) => state.maybeWhen(
          data: (value) => value.currPolyline,
          orElse: () => const <Polyline>{},
        ),
      ),
    );

    final length = ref.watch(
      routesNotifierProvider.select(
        (state) => state.maybeWhen(
          data: (value) => value.polylines.length,
          orElse: () => 0,
        ),
      ),
    );

    final polylineResult = ref.watch(
      routesNotifierProvider.select(
        (state) => state.maybeWhen(
          data: (value) => value.polylineResult,
          orElse: () => null,
        ),
      ),
    );

    ref.listen<AsyncValue<RoutesState>>(
      routesNotifierProvider,
      (state) {
        state.whenData((value) {
          final bounds = value.polylineResult.routes[value.page].bounds;
          if (bounds != null) {
            mapController.animateCamera(
              CameraUpdate.newLatLngBounds(
                bounds.toLatLngBounds(),
                30,
              ),
            );
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
            initialCameraPosition: initialCameraPosition,
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
                      mapController.animateCamera(
                        CameraUpdate.newCameraPosition(initialCameraPosition),
                      );
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
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: const Color(0xFFF5F5FF),
                                ),
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
