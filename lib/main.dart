import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:masjid_go/src/app.dart';
import 'package:masjid_go/src/models/asr_jurisdiction/asr_jurisdiction.dart';
import 'package:masjid_go/src/models/calculation_method/calculation_method.dart';
import 'package:masjid_go/src/models/lat_long/lat_long.dart';
import 'package:masjid_go/src/settings/settings_notifier.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    await Hive.initFlutter();
    Hive.registerAdapter(LatLongAdapter());
    Hive.registerAdapter(SettingsAdapter());
    Hive.registerAdapter(AsrJurisdictionAdapter());
    Hive.registerAdapter(CalculationMethodAdapter());
    runApp(const App());
  }, (Object error, StackTrace stack) {
    if (kDebugMode) print("$error\n $stack");
  });
}
