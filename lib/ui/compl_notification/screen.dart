import 'package:devtestapp/core/extensions/navigator_extension.dart';
import 'package:devtestapp/ui/colors.dart';
import 'package:devtestapp/ui/compl_notification/provider.dart';
import 'package:devtestapp/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<NotificationProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: itemColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: 1,
        items: [
          for (int i = 0; i < 5; i++)
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/icons/icon$i.png"),
              ),
              label: '$i',
              // backgroundColor: backgroundColor,
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              backgroundColor: backgroundColor,
              backPress: () {
                pop();
              },
              title: context.watch<NotificationProvider>().name,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: 65,
                      child: Image.asset('assets/images/success.png'),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Спасибо!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Модераторы скоро рассмотрят вашу жалобу.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        provider.close();
                      },
                      child: const SizedBox(
                        height: 52,
                        child: Center(
                          child: Text('Закрыть'),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
