class Result {
  String message;
  bool status;
  var other;
  Result({this.message, this.status, this.other});
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    message: json['message'] as String,
    status: json['status'] as bool,
    other: json['other'] as dynamic,
  );
}
