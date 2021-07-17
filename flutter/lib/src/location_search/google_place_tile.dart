import 'package:distance/distance.dart';
import 'package:flutter/material.dart';
import 'package:masjid_go/src/models/google_place/google_place.dart';

class GooglePlaceTile extends StatelessWidget {
  final GooglePlace place;
  final VoidCallback onTap;

  const GooglePlaceTile({
    Key? key,
    required this.place,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String distanceString = "";
    if (place.distance != null) {
      if (place.distance! < 1) {
        distanceString =
            "${Distance(meters: place.distance!).inMiles.toStringAsFixed(2)} mi";
      } else if (place.distance! < 10) {
        distanceString =
            "${Distance(meters: place.distance!).inMiles.toStringAsFixed(1)} mi";
      } else {
        distanceString =
            "${Distance(meters: place.distance!).inMiles.round()} mi";
      }
    }

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      leading: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.place, color: Colors.deepPurple),
          ),
          Visibility(
            visible: distanceString.isNotEmpty,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Text(distanceString),
          ),
        ],
      ),
      title: Text(place.primaryText),
      subtitle: Text(place.secondaryText),
      onTap: onTap,
    );
  }
}
