import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/default_button.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';

import 'components/splash_content.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Seyed's Store, let's shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "We help people connect with store \naround of Iran ",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    text: splashData[index]["text"]!,
                    image: splashData[index]["image"]!,
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      DefaultButton(
                          text: "Continue",
                          onPressed: () {
                            // Navigator.pushNamed(context, SignInScreen.routeName);
                          }),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: currentPage == index ? primary : const Color(0xffd8d8d8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
