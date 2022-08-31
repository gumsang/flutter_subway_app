import 'package:flutter_subway_api/data/data_source/remote/subway_api.dart';

import '../data_source/remote/subway_dto.dart';
import '../model/subway_model.dart';
import 'subway_repository.dart';

class SubwayRepositoryImpl implements SubwayRepository {
  final SubwayApi _api;
  SubwayRepositoryImpl(this._api);

  @override
  Future<List<Subway>> getSubwayArrival(String query) async {
    SubwayDto subwayDto = await _api.getSubway(query);
    if (subwayDto.realtimeArrivalList == null) {
      return List.empty();
    }
    List<RealtimeArrivalList> trainLineNm = subwayDto.realtimeArrivalList!;
    return trainLineNm.map((e) => Subway.fromJson(e.toJson())).toList();
  }

  Future<List<Subway>> fetchSubway(String inputText) async {
    return await getSubwayArrival(inputText);
  }
}
