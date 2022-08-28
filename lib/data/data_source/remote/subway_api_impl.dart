import 'dart:convert';

import 'package:flutter_subway_api/data/data_source/remote/subway_api.dart';
import 'package:http/http.dart' as http;

import '../../model/subway_model.dart';

class SubwayApiImpl implements SubwayApi {
  List<Subway> subwayList = [];

  @override
  Future<Map<String, dynamic>> getSubway(String query) async {
    Uri url = Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/$query');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['realtimeArrivalList'] == null) {
      return {};
    }

    return json;
  }
}
