import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayer_times.freezed.dart';

@freezed
class PrayerTimes with _$PrayerTimes {
  const factory PrayerTimes({
    required DateTime fajr,
    required DateTime dhuhr,
    required DateTime asr,
    required DateTime maghrib,
    required DateTime isha,
  }) = _PrayerTimes;
}
