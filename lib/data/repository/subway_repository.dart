import 'package:flutter_subway_api/data/model/subway_model.dart';

abstract class SubwayRepository {
  Future<List<Subway>> getSubwayArrival(String query);
}
