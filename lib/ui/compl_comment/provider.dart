import 'package:devtestapp/core/api/complaint_api.dart';
import 'package:devtestapp/core/extensions/navigator_extension.dart';
import 'package:flutter/material.dart';

class CommentProvider extends ChangeNotifier {
  final ComplaintApi _api;
  String category = '';
  String _comment = '';

  var _status = Status.init;

  CommentProvider(this._api);

  Status get status => _status;

  void setCategory(String name) {
    if(category.isNotEmpty) return;
    print('name - $name');
    category = name;
  }

  void changeComment(String comment) {
    _comment = comment;
  }

  Future<void> sendComment() async {
    _status = Status.loading;
    notifyListeners();
    var response = await _api.sendComment(category, _comment);
    print('response *** - $response');
    if (response is int) {
      _status = Status.success;
    } else {
      _status = Status.fail;
      print('fail - ${response.toString()}');
    }
    openNextScreen();
    notifyListeners();
  }

  String get complaintText => _api.complaintText;

  String get name => _api.name;

  void openNextScreen() async{
    Future.delayed(const Duration(seconds: 3));
    replace(Routes.complaintNotification);
  }
}

enum Status {
  init,
  loading,
  success,
  fail,
}
