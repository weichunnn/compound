import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/normal_template.dart';
import '../../../../size_config.dart';
import '../../../auth_navigation/auth_cubit.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _email = context.read<AuthCubit>().credentials.email;
    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            NormalTemplate(
              image: 'assets/images/forgot_password.svg',
              title: 'Verification Code',
              caption: 'Please enter the verfication code we sent to $_email',
              bolded: _email,
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            OtpForm(),
          ],
        ),
      ),
    );
  }
}
