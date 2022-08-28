import 'package:flutter_subway_api/data/data_source/remote/subway_api.dart';

import '../model/subway_model.dart';
import 'subway_repository.dart';

class SubwayRepositoryImpl implements SubwayRepository {
  final SubwayApi _api;
  SubwayRepositoryImpl(this._api);

  @override
  Future<List<Subway>> getSubwayArrival(String query) async {
    Map<String, dynamic> json = await _api.getSubway(query);
    if (json['realtimeArrivalList'] == null) {
      return List.empty();
    }
    Iterable trainLineNm = json['realtimeArrivalList'];
    return trainLineNm.map((e) => Subway.fromJson(e)).toList();
  }

  Future<List<Subway>> fetchSubway(String inputText) async {
    return await getSubwayArrival(inputText);
  }
}
