import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../size_config.dart';
import '../../../../components/normal_template.dart';
import '../../../../components/phone_input_form.dart';
import '../../phone_verification_bloc.dart';
import '../../phone_verification_state.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            NormalTemplate(
              image: 'assets/images/phone_verification.svg',
              title: 'Verify your number',
              caption:
                  'Please enter your country code and your \ncurrent mobile phone number',
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            BlocBuilder<PhoneVerificationBloc, PhoneVerificationState>(
              builder: (context, state) {
                return PhoneInputForm(
                  bloc: context.read<PhoneVerificationBloc>(),
                  state: state,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
