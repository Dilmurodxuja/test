class RequestModel {
  RequestModel({
    required this.toUserId,
    required this.category,
    required this.text,
  });

  final int toUserId;
  final String category;
  final String text;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        toUserId: json["to_user_id"] ?? '',
        category: json["category"] ?? '',
        text: json["text"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "to_user_id": toUserId,
        "category": category,
        "text": text,
      };
}
