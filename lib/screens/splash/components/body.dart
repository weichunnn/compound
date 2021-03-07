import 'package:compound/constants.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'image': 'assets/images/splash_1.svg',
      'title': 'Safe and Secure',
      'text':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    },
    {
      'image': 'assets/images/splash_2.svg',
      'title': 'Seamless Integration',
      'text':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    },
    {
      'image': 'assets/images/splash_3.svg',
      'title': 'Powerful Insights',
      'text':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    },
    {
      'image': 'assets/images/splash_4.svg',
      'title': 'Carefree Automation',
      'text':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]['image'],
                  title: splashData[index]['title'],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Spacer(flex: 2),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: currentPage == 0
                        ? Text(
                            'Swipe to learn more',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(12),
                            ),
                          )
                        : Text(''),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(flex: 3),
                  DefaultButton(
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                  ),
                  Spacer(flex: 1)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.symmetric(horizontal: 7.5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFC4C4C4),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
