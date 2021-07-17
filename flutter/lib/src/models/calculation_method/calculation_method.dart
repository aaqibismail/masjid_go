import 'package:hive/hive.dart';

part 'calculation_method.g.dart';

@HiveType(typeId: 3)
enum CalculationMethod {
  @HiveField(0)
  shia,
  @HiveField(1)
  karachi,
  @HiveField(2)
  isna,
  @HiveField(3)
  mwl,
  @HiveField(4)
  makkah,
  @HiveField(5)
  egypt,
  @HiveField(6)
  tehran,
  @HiveField(7)
  gulf,
  @HiveField(8)
  kuwait,
  @HiveField(9)
  qatar,
  @HiveField(10)
  singapore,
  @HiveField(11)
  france,
  @HiveField(12)
  turkey,
  @HiveField(13)
  russia,
}

extension CalculationMethodX on CalculationMethod {
  String get description {
    final list = [
      "Shia Ithna-Ansari",
      "University of Islamic Sciences, Karachi",
      "Islamic Society of North America",
      "Muslim World League",
      "Umm Al-Qura University, Makkah",
      "Egyptian General Authority of Survey",
      "Institute of Geophysics, University of Tehran",
      "Gulf Region",
      "Kuwait",
      "Qatar",
      "Majlis Ugama Islam Singapura, Singapore",
      "Union Organization islamic de France",
      "Diyanet İşleri Başkanlığı, Turkey",
      "Spiritual Administration of Muslims of Russia",
    ];
    return list[index];
  }

  int get methodNumber {
    final list = [0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14];
    return list[index];
  }
}
