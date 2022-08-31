import 'package:flutter_subway_api/data/data_source/remote/subway_dto.dart';

abstract class SubwayApi {
  Future<SubwayDto> getSubway(String query);
}
