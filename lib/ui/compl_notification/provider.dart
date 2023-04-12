import 'package:devtestapp/core/api/complaint_api.dart';
import 'package:devtestapp/core/extensions/navigator_extension.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  final ComplaintApi _api;
  late String complaintType;

  NotificationProvider(this._api);

  void setComplaintType(String type) {
    print('type - $type');
    complaintType = type;
  }

  String get complaintText => _api.complaintText;

  String get name => _api.name;

  void openNextScreen() async{
    Future.delayed(const Duration(seconds: 3));
    replace(Routes.complaintNotification);
  }

  void close() {
    pop();
  }
}