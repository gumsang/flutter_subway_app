import 'dart:convert';

import 'package:flutter_subway_api/data/data_source/remote/subway_api.dart';
import 'package:flutter_subway_api/data/data_source/remote/subway_dto.dart';
import 'package:http/http.dart' as http;

class SubwayApiImpl implements SubwayApi {
  @override
  Future<SubwayDto> getSubway(String query) async {
    Uri url = Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/$query');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);

    return SubwayDto.fromJson(json);
  }
}
