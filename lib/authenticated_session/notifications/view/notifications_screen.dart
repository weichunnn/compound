import 'package:compound/authenticated_session/notifications/notifications_cubit.dart';
import 'package:compound/authenticated_session/notifications/notifications_state.dart';
import 'package:compound/components/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authenticated_session_navigation/authenticated_session_cubit.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'components/notifications_card.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 75,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
          onPressed: () {
            context.read<AuthenticatedSessionCubit>().showDashboard();
          },
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => NotificationsCubit(),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(25)),
            width: double.infinity,
            height: SizeConfig.screenHeight * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(0, -5),
                )
              ],
            ),
            child: SingleChildScrollView(
              child: BlocListener<NotificationsCubit, NotificationsState>(
                listener: (BuildContext context, state) {
                  if (state is NotificationsError) {
                    toast(
                      context: context,
                      text: state.error,
                      backgroundColor: kErrorColor,
                      textColor: Colors.white,
                      iconColor: Colors.white,
                    );
                  }
                },
                child: BlocBuilder<NotificationsCubit, NotificationsState>(
                  builder: (BuildContext context, state) {
                    if (state is NotificationsInitial || state is NotificationsLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is NotificationsLoaded) {
                      return Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'New',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenHeight(16),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Column(
                                  children: state.newUpdates
                                      .map(
                                        (noti) => NotificationCard(
                                          text: noti['text'],
                                          timeStamp: noti['timeStamp'],
                                        ),
                                      )
                                      .toList()),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(getProportionateScreenHeight(7.5)),
                                child: Text(
                                  'Earlier',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenHeight(16),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Column(
                                  children: state.pastUpdates
                                      .map(
                                        (noti) => NotificationCard(
                                          text: noti['text'],
                                          timeStamp: noti['timeStamp'],
                                        ),
                                      )
                                      .toList()),
                            ],
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
