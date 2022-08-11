import 'dart:convert';

import 'package:http/http.dart' as http;

import 'subway_model.dart';

class SubwayApi {
  SubwayApi() {
    fetchSubway('');
  }
  List<Subway> subwayList = [];

  Future<List<Subway>> getSubway(String query) async {
    Uri url = Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/$query');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['realtimeArrivalList'] == null) {
      return List.empty();
    }
    Iterable trainLineNm = json['realtimeArrivalList'];
    return trainLineNm.map((e) => Subway.fromJson(e)).toList();
  }

  void fetchSubway(String inputText) async {
    subwayList = await getSubway(inputText);
  }
}
