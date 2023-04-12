import 'package:devtestapp/ui/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final Function()? backPress;

  const CustomAppBar({
    Key? key,
    required this.backgroundColor,
    required this.title,
    required this.backPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 1),
          )
        ]
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: greyColor,
                  shape: BoxShape.circle,
                ),
                height: 70,
                child: Text(
                  title[0],
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    // fontFamily:
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    )),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                color: Colors.black,
                onPressed: backPress,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
