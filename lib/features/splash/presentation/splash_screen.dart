import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_bottom_navigation.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_button.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

import 'components/splash_content.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String route = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Seyed's Store, let's shop!",
      "images": Assets.imagesSplash1
    },
    {
      "text": "We help people connect with store \naround of Iran ",
      "images": Assets.imagesSplash2
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "images": Assets.imagesSplash3
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"]!,
                  image: splashData[index]["images"]!,
                ),
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    MyButton(
                      text: "Continue",
                      onPressed: () => Navigator.pushNamed(
                        context,
                        MyBottomNavigation.route,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 4),
      width: currentPage == index ? 12 : 4,
      height: 4,
      decoration: BoxDecoration(
        color: currentPage == index ? context.scheme.primary : gray,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
