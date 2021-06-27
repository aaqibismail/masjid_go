import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:masjid_enroute/models/lat_lng_adapter.dart';
import 'package:masjid_enroute/state_notifiers/settings/settings_notifier.dart';
import 'package:masjid_enroute/widgets/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await Hive.initFlutter();
  Hive.registerAdapter(LatLngAdapter());
  Hive.registerAdapter(SettingsAdapter());
  runApp(const App());
}
