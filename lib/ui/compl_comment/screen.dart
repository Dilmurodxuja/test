import 'package:devtestapp/core/extensions/navigator_extension.dart';
import 'package:devtestapp/ui/colors.dart';
import 'package:devtestapp/ui/compl_comment/provider.dart';
import 'package:devtestapp/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CommentProvider>();
    provider.setCategory((ModalRoute.of(context)!.settings.arguments as Map)['category']);
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
              title: context.watch<CommentProvider>().name,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.category,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      provider.complaintText,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Комментарий (необязательно)',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 120,
                      child: TextField(
                        expands: true,
                        textAlign: TextAlign.start,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          provider.changeComment(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Опишите причину жалобы',
                          filled: true,
                          fillColor: textFieldColor,
                          hoverColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                        onPressed: context.watch<CommentProvider>().status == Status.loading
                            ? null
                            : () {
                                provider.sendComment();
                              },
                        child: SizedBox(
                          height: 52,
                          child: Builder(
                            builder: (context) {
                              if (context.watch<CommentProvider>().status == Status.loading) {
                                return Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.white,
                                ));
                              }
                              return Center(child: Text('Отправить жалобу'));
                            },
                          ),
                        ),
                    ),
                    // Text(context.watch<CommentProvider>().),
                    // Expanded(
                    // ),
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
