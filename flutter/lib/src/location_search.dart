import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:masjid_go/src/location_search/google_place_tile.dart';
import 'package:masjid_go/src/location_search/location_search_notifier.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/providers.dart';

class LocationSearch extends SearchDelegate {
  final LocationSearchNotifer locationSearchNotifer;
  final LatLong? loc;
  Timer? timer;

  LocationSearch({
    required this.locationSearchNotifer,
    this.loc,
  }) : super(keyboardType: TextInputType.text);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(CupertinoIcons.chevron_left),
    );
  }

  void newQuery() {
    timer?.cancel();
    timer = Timer(
      const Duration(milliseconds: 250),
      () => locationSearchNotifer.search(query, loc: loc),
    );
  }

  @override
  Widget buildResults(BuildContext context) => buildSuggestions(context);

  @override
  Widget buildSuggestions(BuildContext context) {
    newQuery();

    return Consumer(
      builder: (context, ref, child) {
        final places = ref.watch(locationSearchProvider);
        return ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return GooglePlaceTile(
              place: place,
              onTap: () => close(context, place),
            );
          },
        );
      },
    );
  }
}
