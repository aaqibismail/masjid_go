import 'dart:convert' show json;

import 'package:flutter/widgets.dart' show debugPrint;
import 'package:http/http.dart' as http;
import 'package:masjid_go/src/models/asr_jurisdiction/asr_jurisdiction.dart';
import 'package:masjid_go/src/models/calculation_method/calculation_method.dart';
import 'package:masjid_go/src/models/prayer_times/prayer_times.dart';

class PrayersRepository {
  Future<PrayerTimes?> getPrayerTimes(
    DateTime day,
    String address,
    CalculationMethod method,
    AsrJurisdiction asrJurisdiction,
  ) async {
    try {
      final uri = _buildPrayerTimesUrl(day, address, method, asrJurisdiction);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        if (body.status == "OK") {
          final timings = body["data"]["timings"];
          final fajr = _dateFromString(timings["Fajr"] as String);
          final dhuhr = _dateFromString(timings["Dhuhr"] as String);
          final asr = _dateFromString(timings["Asr"] as String);
          final maghrib = _dateFromString(timings["Maghrib"] as String);
          final isha = _dateFromString(timings["Isha"] as String);

          return PrayerTimes(
            fajr: fajr,
            dhuhr: dhuhr,
            asr: asr,
            maghrib: maghrib,
            isha: isha,
          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  DateTime _dateFromString(String date) {
    final now = DateTime.now();
    final nums = date.split(':');
    final hours = int.parse(nums[0]);
    final mins = int.parse(nums[1]);
    return DateTime(now.year, now.month, now.day, hours, mins);
  }

  Uri _buildPrayerTimesUrl(
    DateTime day,
    String address,
    CalculationMethod method,
    AsrJurisdiction asrJurisdiction,
  ) {
    final params = {
      'date_or_timestamp': '${day.millisecondsSinceEpoch}',
      'address': address,
      'method': '${method.methodNumber}',
      'school': '${asrJurisdiction.index}',
    };
    return Uri.https('https://api.aladhan.com', '/v1/timingsByAddress', params);
  }
}
