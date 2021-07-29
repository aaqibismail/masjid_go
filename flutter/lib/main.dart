import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:masjid_go/src/app.dart';
import 'package:masjid_go/src/config.dart';
import 'package:masjid_go/src/models/asr_jurisdiction/asr_jurisdiction.dart';
import 'package:masjid_go/src/models/calculation_method/calculation_method.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/settings/settings_notifier.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    config = Config(
      googleMapsKey:
          dotenv.env[const String.fromEnvironment("GOOGLE_MAPS_KEY")]!,
      backendUrl: dotenv.env[const String.fromEnvironment("BACKEND_URL")]!,
    );

    await Hive.initFlutter();
    Hive.registerAdapter(LatLongAdapter());
    Hive.registerAdapter(SettingsAdapter());
    Hive.registerAdapter(AsrJurisdictionAdapter());
    Hive.registerAdapter(CalculationMethodAdapter());
    runApp(const App());
  }, (Object error, StackTrace stack) {
    debugPrint("$error\n $stack");
  });
}
