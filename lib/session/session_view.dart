import 'package:compound/app_navigation/session_cubit.dart';
import 'package:compound/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialization for Sizing Configs
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Session View',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
