import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../splash_cubit.dart';
import 'splash_content.dart';
import '../../../../components/default_button.dart';
import '../../../../welcome/welcome_navigation/welcome_cubit.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List splashData = context.read<SplashCubit>().splashData;
    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: BlocBuilder<SplashCubit, int>(
          builder: (context, state) {
            // Function to build dots, utlised later
            AnimatedContainer buildDot({int index}) {
              return AnimatedContainer(
                duration: kAnimationDuration,
                margin: EdgeInsets.symmetric(horizontal: 7.5),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: state == index ? kPrimaryColor : Color(0xFFC4C4C4),
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      context.read<SplashCubit>().pageChanged(value);
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, state) => SplashContent(
                      image: splashData[state]['image'],
                      title: splashData[state]['title'],
                      text: splashData[state]['text'],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Spacer(flex: 2),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: state == 0
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
                          context.read<WelcomeCubit>().gotoSignUp();
                        },
                      ),
                      Spacer(flex: 1)
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
