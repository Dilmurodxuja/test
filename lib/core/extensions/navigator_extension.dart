import 'package:devtestapp/main.dart';
import 'package:flutter/material.dart';

enum Routes {
  complaintQuestion,
  complaintComment,
  complaintNotification,
}

Future<dynamic> push(Routes route, {Map<String, dynamic>? arguments}) async {
  return await Navigator.pushNamed(
    mainKey.currentState!.context,
    route.name,
    arguments: arguments,
  );
}

Future<dynamic> replace(Routes route, {Map<String, dynamic>? arguments}) async {
  return await Navigator.pushReplacementNamed(
    mainKey.currentState!.context,
    route.name,
    arguments: arguments,
  );
}

dynamic pop([dynamic result]) async {
  return Navigator.pop(
    mainKey.currentState!.context,
    result,
  );
}

dynamic popUntil({dynamic routeTo}) async {
  return Navigator.popUntil(
    mainKey.currentState!.context,
    (route) => routeTo,
  );
}