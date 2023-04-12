import 'package:devtestapp/core/api/complaint_api.dart';
import 'package:devtestapp/core/extensions/navigator_extension.dart';
import 'package:flutter/material.dart';

class QuestionProvider extends ChangeNotifier {
  final ComplaintApi _api;

  QuestionProvider(this._api);

  List<String> get complaints => _api.complaints;

  String get name => _api.name;

  void openCommentScreen(int index) {
    push(Routes.complaintComment, arguments: {'category': complaints[index]});
  }
}
