import 'package:badges/badges.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../app_navigation/session_cubit.dart';
import '../../../components/bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = 0;
    // Initialization for Sizing Configs
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SizedBox(
        width: double.infinity,
        child: CustomPaint(
          size: Size(
            SizeConfig.screenWidth,
            SizeConfig.screenHeight,
          ),
          painter: BackgroundPainter(),
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Container(
                height: SizeConfig.screenHeight,
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EasyRichText(
                              '\$ 2,705',
                              defaultStyle: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenHeight(25),
                                fontWeight: FontWeight.bold,
                              ),
                              patternList: [
                                EasyRichTextPattern(
                                  targetString: '2,705',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenHeight(40),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Available Cash Balance',
                              style: TextStyle(
                                fontSize: getProportionateScreenHeight(14),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10),
                          ),
                          child: counter != 0
                              ? Badge(
                                  toAnimate: false,
                                  padding:
                                      EdgeInsets.all(counter < 10 ? 7.5 : 5),
                                  position: BadgePosition.topEnd(end: -5),
                                  badgeContent: Text(
                                    counter.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                    size: getProportionateScreenHeight(30),
                                  ),
                                )
                              : Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: getProportionateScreenHeight(30),
                                ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Welcome View',
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        BlocProvider.of<SessionCubit>(context).signOut();
                      },
                      icon: Icon(Icons.logout),
                      label: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double _kCurveHeight = 25;
  final topHeight = getProportionateScreenHeight(275);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.lineTo(0, topHeight - _kCurveHeight);
    path.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    path.lineTo(size.width, 0);
    path.close();
    var rect = Offset.zero & size;
    var paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          kPrimaryColor,
          kSecondaryColor,
        ],
      ).createShader(rect);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
