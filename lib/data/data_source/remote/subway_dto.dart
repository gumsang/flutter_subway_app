class SubwayDto {
  ErrorMessage? errorMessage;
  List<RealtimeArrivalList>? realtimeArrivalList;

  SubwayDto({this.errorMessage, this.realtimeArrivalList});

  SubwayDto.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'] != null
        ? ErrorMessage.fromJson(json['errorMessage'])
        : null;
    if (json['realtimeArrivalList'] != null) {
      realtimeArrivalList = <RealtimeArrivalList>[];
      json['realtimeArrivalList'].forEach((v) {
        realtimeArrivalList!.add(RealtimeArrivalList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errorMessage != null) {
      data['errorMessage'] = errorMessage!.toJson();
    }
    if (realtimeArrivalList != null) {
      data['realtimeArrivalList'] =
          realtimeArrivalList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ErrorMessage {
  int? status;
  String? code;
  String? message;
  String? link;
  String? developerMessage;
  int? total;

  ErrorMessage(
      {this.status,
      this.code,
      this.message,
      this.link,
      this.developerMessage,
      this.total});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    link = json['link'];
    developerMessage = json['developerMessage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['link'] = link;
    data['developerMessage'] = developerMessage;
    data['total'] = total;
    return data;
  }
}

class RealtimeArrivalList {
  int? totalCount;
  int? rowNum;
  int? selectedCount;
  String? subwayId;
  String? updnLine;
  String? trainLineNm;
  String? subwayHeading;
  String? statnFid;
  String? statnTid;
  String? statnId;
  String? statnNm;
  String? ordkey;
  String? subwayList;
  String? statnList;
  String? btrainSttus;
  String? barvlDt;
  String? btrainNo;
  String? bstatnId;
  String? bstatnNm;
  String? recptnDt;
  String? arvlMsg2;
  String? arvlMsg3;
  String? arvlCd;

  RealtimeArrivalList(
      {this.totalCount,
      this.rowNum,
      this.selectedCount,
      this.subwayId,
      this.updnLine,
      this.trainLineNm,
      this.subwayHeading,
      this.statnFid,
      this.statnTid,
      this.statnId,
      this.statnNm,
      this.ordkey,
      this.subwayList,
      this.statnList,
      this.btrainSttus,
      this.barvlDt,
      this.btrainNo,
      this.bstatnId,
      this.bstatnNm,
      this.recptnDt,
      this.arvlMsg2,
      this.arvlMsg3,
      this.arvlCd});

  RealtimeArrivalList.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    rowNum = json['rowNum'];
    selectedCount = json['selectedCount'];
    subwayId = json['subwayId'];
    updnLine = json['updnLine'];
    trainLineNm = json['trainLineNm'];
    subwayHeading = json['subwayHeading'];
    statnFid = json['statnFid'];
    statnTid = json['statnTid'];
    statnId = json['statnId'];
    statnNm = json['statnNm'];
    ordkey = json['ordkey'];
    subwayList = json['subwayList'];
    statnList = json['statnList'];
    btrainSttus = json['btrainSttus'];
    barvlDt = json['barvlDt'];
    btrainNo = json['btrainNo'];
    bstatnId = json['bstatnId'];
    bstatnNm = json['bstatnNm'];
    recptnDt = json['recptnDt'];
    arvlMsg2 = json['arvlMsg2'];
    arvlMsg3 = json['arvlMsg3'];
    arvlCd = json['arvlCd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    data['rowNum'] = rowNum;
    data['selectedCount'] = selectedCount;
    data['subwayId'] = subwayId;
    data['updnLine'] = updnLine;
    data['trainLineNm'] = trainLineNm;
    data['subwayHeading'] = subwayHeading;
    data['statnFid'] = statnFid;
    data['statnTid'] = statnTid;
    data['statnId'] = statnId;
    data['statnNm'] = statnNm;
    data['ordkey'] = ordkey;
    data['subwayList'] = subwayList;
    data['statnList'] = statnList;
    data['btrainSttus'] = btrainSttus;
    data['barvlDt'] = barvlDt;
    data['btrainNo'] = btrainNo;
    data['bstatnId'] = bstatnId;
    data['bstatnNm'] = bstatnNm;
    data['recptnDt'] = recptnDt;
    data['arvlMsg2'] = arvlMsg2;
    data['arvlMsg3'] = arvlMsg3;
    data['arvlCd'] = arvlCd;
    return data;
  }
}
