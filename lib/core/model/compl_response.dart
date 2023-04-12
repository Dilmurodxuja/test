class ResponseModel {
  ResponseModel({
    required this.code,
    required this.message,
    required this.payload,
  });

  final int code;
  final String message;
  final String payload;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        code: json["code"] ?? '',
        message: json["message"] ?? '',
        payload: json["payload"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "payload": payload,
      };
}
