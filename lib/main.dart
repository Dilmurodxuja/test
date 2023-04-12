import 'package:devtestapp/core/extensions/navigator_extension.dart';
import 'package:devtestapp/di.dart';
import 'package:devtestapp/ui/compl_comment/provider.dart';
import 'package:devtestapp/ui/compl_comment/screen.dart';
import 'package:devtestapp/ui/compl_notification/provider.dart';
import 'package:devtestapp/ui/compl_notification/screen.dart';
import 'package:devtestapp/ui/compl_question/provider.dart';
import 'package:devtestapp/ui/compl_question/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

final mainKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: mainKey,
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.complaintQuestion.name,
      routes: {
        Routes.complaintQuestion.name: (_) => ChangeNotifierProvider(
              create: (_) => QuestionProvider(di.get()),
              child: const QuestionScreen(),
            ),
        Routes.complaintComment.name: (_) => ChangeNotifierProvider(
              create: (_) => CommentProvider(di.get()),
              child: const CommentScreen(),
            ),
        Routes.complaintNotification.name: (_) => ChangeNotifierProvider(
              create: (_) => NotificationProvider(di.get()),
              child: const NotificationScreen(),
            ),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}