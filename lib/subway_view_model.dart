import 'package:flutter/material.dart';

import 'subway_api.dart';
import 'subway_model.dart';

class SubwayScreenViewModel extends ChangeNotifier {
  final _subwayApi = SubwayApi();

  List<Subway> arrivalList = [];

  void fetchArrivalLists(String query) async {
    arrivalList = await _subwayApi.getSubway(query);
    notifyListeners();
  }
}
