import 'package:devtestapp/core/api/api_base.dart';
import 'package:devtestapp/core/model/compl_request.dart';

class ComplaintApi {
  final ApiBase _base;

  ComplaintApi(this._base);

  var _name = "Константин Володарский";

  var _complaints = const [
    'Спам',
    'Мошенничество',
    'Оскорбления',
    'Откровенное изображение',
    'Проблема с профилем',
    'Нарушение интеллектуальных прав',
    'Прочее',
  ];

  var _complaintText =
      'Отправьте жалобу, если пользователь рассылает рекламные сообщения, комментарии или другим способом распространяет рекламу в непредназначенных для этого местах.';

  Future<List<String>> gets() async {
    Future.delayed(const Duration(milliseconds: 100));
    final response = await _base.dio.get('');
    return (response.data as List).map((e) => e.toString()).toList();
  }

  String get complaintText => _complaintText;

  List<String> get complaints => _complaints;

  String get name => _name;

  dynamic sendComment(String category, String comment) async {
    try{
      final response = await _base.dio.post(
        'complaint/profile',
        data: RequestModel(toUserId: 12, category: category, text: comment).toJson(),
      );
    if ((response.data as Map)['code'] == 200) {
      return 200;
    }
    return (response.data as Map)['message'];
    }
    catch(e){
      print('error *** $e');
    }
  }
}
