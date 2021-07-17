// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i2;
import 'package:flutter_polyline_points/flutter_polyline_points.dart' as _i8;

import 'screens/home.dart' as _i3;
import 'screens/map_routes.dart' as _i4;
import 'screens/masjid_stops.dart' as _i6;
import 'screens/settings.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    Home.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.Home();
        }),
    MapRoutes.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<MapRoutesArgs>(
              orElse: () => MapRoutesArgs(
                  origin: pathParams.optString('origin'),
                  destination: pathParams.optString('destination')));
          return _i4.MapRoutes(
              key: args.key,
              origin: args.origin,
              destination: args.destination);
        }),
    Settings.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.Settings();
        }),
    MasjidStops.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MasjidStopsArgs>();
          return _i6.MasjidStops(key: args.key, route: args.route);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(Home.name, path: '/'),
        _i1.RouteConfig(MapRoutes.name, path: '/routes'),
        _i1.RouteConfig(Settings.name, path: '/settings'),
        _i1.RouteConfig(MasjidStops.name, path: '/masjid-stops')
      ];
}

class Home extends _i1.PageRouteInfo {
  const Home() : super(name, path: '/');

  static const String name = 'Home';
}

class MapRoutes extends _i1.PageRouteInfo<MapRoutesArgs> {
  MapRoutes({_i7.Key? key, String? origin, String? destination})
      : super(name,
            path: '/routes',
            args: MapRoutesArgs(
                key: key, origin: origin, destination: destination));

  static const String name = 'MapRoutes';
}

class MapRoutesArgs {
  const MapRoutesArgs({this.key, this.origin, this.destination});

  final _i7.Key? key;

  final String? origin;

  final String? destination;
}

class Settings extends _i1.PageRouteInfo {
  const Settings() : super(name, path: '/settings');

  static const String name = 'Settings';
}

class MasjidStops extends _i1.PageRouteInfo<MasjidStopsArgs> {
  MasjidStops({_i7.Key? key, required _i8.Route route})
      : super(name,
            path: '/masjid-stops',
            args: MasjidStopsArgs(key: key, route: route));

  static const String name = 'MasjidStops';
}

class MasjidStopsArgs {
  const MasjidStopsArgs({this.key, required this.route});

  final _i7.Key? key;

  final _i8.Route route;
}
