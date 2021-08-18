import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:masjid_go/src/object_extensions.dart';

part 'asr_jurisdiction.g.dart';

@HiveType(typeId: 2)
enum AsrJurisdiction {
  @HiveField(0)
  standard,
  @HiveField(1)
  hanafi,
}

extension AsrJurisdictionX on AsrJurisdiction {
  String get description => describeEnum(this).capitalize; 
}
