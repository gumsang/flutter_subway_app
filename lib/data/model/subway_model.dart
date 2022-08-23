class Subway {
  final String trainLineNm;

  Subway({required this.trainLineNm});

  factory Subway.fromJson(Map<String, dynamic> json) {
    return Subway(
      trainLineNm: json['trainLineNm'] as String,
    );
  }
}
