import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../app_navigation/session_cubit.dart';
import '../../../components/bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            minimum: EdgeInsets.only(left: 35, right: 35),
            child: SingleChildScrollView(
              child: Container(
                height: SizeConfig.screenHeight,
                child: Column(
                  children: [
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

Widget bottomNavigationBar() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    ),
    child: BottomNavigationBar(
      backgroundColor: Colors.transparent,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_activity), label: 'Activity'),
        BottomNavigationBarItem(icon: Icon(Icons.inbox), label: 'Inbox'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    ),
  );
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
