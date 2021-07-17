import 'package:auto_route/annotations.dart';
import 'package:masjid_go/src/home.dart';
import 'package:masjid_go/src/map_routes.dart';
import 'package:masjid_go/src/masjid_stops.dart';
import 'package:masjid_go/src/settings.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: Home, initial: true),
    AutoRoute(path: '/routes', page: MapRoutes),
    AutoRoute(path: '/settings', page: Settings),
    AutoRoute(page: MasjidStops),
  ],
)
class $AppRouter {}
