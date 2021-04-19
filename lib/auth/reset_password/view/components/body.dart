import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../../auth/reset_password/view/components/reset_password_form.dart';
import '../../../../components/normal_template.dart';
import '../../../form_submission_status.dart';
import '../../reset_password_bloc.dart';
import '../../reset_password_state.dart';
import '../../../../components/loader.dart';
import '../../../../components/toast.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuildContext loadingDialogContext;
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
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
                image: 'assets/images/reset_password.svg',
                title: 'Reset Password',
                caption:
                    'Enter the OTP received, and your new password below. We are just being extra safe to protect your account.',
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              ResetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
