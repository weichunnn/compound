import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/normal_template.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../form_submission_status.dart';
import '../../otp_bloc.dart';
import '../../otp_state.dart';
import 'otp_form.dart';
import '../../../../components/loader.dart';
import '../../../../components/toast.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuildContext loadingDialogContext;
    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        final formStatus = state.formSubmissionStatus;
        if (formStatus is SubmissionFailure ||
            formStatus is SubmissionSuccess) {
          // Remove Loader displayed on screen
          Navigator.of(loadingDialogContext).pop();
        }
        if (formStatus is SubmissionInProgress) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) {
              loadingDialogContext = dialogContext;
              return Loader();
            },
          );
        } else if (formStatus is SubmissionFailure) {
          toast(
            context: context,
            text: state.errorMessage,
            backgroundColor: kErrorColor,
            textColor: Colors.white,
            iconColor: Colors.white,
          );
        }
      },
      child: SafeArea(
        minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              NormalTemplate(
                image: 'assets/images/forgot_password.svg',
                title: 'Verification Code',
                caption:
                    'Please enter the verfication code we sent to your email',
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              OtpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
