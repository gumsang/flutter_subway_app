import 'package:flutter/material.dart';
import 'package:flutter_subway_api/data/repository/subway_repository.dart';

import '../../data/model/subway_model.dart';

class SubwayScreenViewModel extends ChangeNotifier {
  final SubwayRepository _repo;
  SubwayScreenViewModel(this._repo);

  List<Subway> arrivalList = [];

  void fetchArrivalLists(String query) async {
    arrivalList = await _repo.getSubwayArrival(query);
    notifyListeners();
  }
}
