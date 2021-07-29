import 'package:masjid_go/src/map_repository/map_repository.dart';
import 'package:masjid_go/src/map_repository/map_repository_common.dart';

MapRepository getMapRepository(MapRepositoryCommon common) =>
    throw UnsupportedError(
      'Cannot create a MapRepository without the packages dart:html or dart:io',
    );
