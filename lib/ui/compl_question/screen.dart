import 'dart:ffi';

import 'package:devtestapp/ui/colors.dart';
import 'package:devtestapp/ui/compl_question/provider.dart';
import 'package:devtestapp/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<QuestionProvider>();
    return Scaffold(
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
              backPress: () {},
              title: context.watch<QuestionProvider>().name,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  const Text(
                    'Что на странице Контантина кажется вам недопустимым?',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                  Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: provider.complaints.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          provider.openCommentScreen(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            // textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),
                            provider.complaints[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
