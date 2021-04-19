import 'package:flutter/material.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../auth_navigation/auth_cubit.dart';
import '../../../form_submission_status.dart';
import '../../sign_up_bloc.dart';
import '../../sign_up_event.dart';
import '../../sign_up_state.dart';
import 'sign_up_form.dart';
import '../../../../components/central_divider.dart';
import '../../../../components/social_card.dart';
import '../../../../components/app_loader.dart';
import '../../../../components/toast.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuildContext loadingDialogContext;
    return BlocListener<SignUpBloc, SignUpState>(
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
          context.read<SignUpBloc>().add(SignUpResetForm());
        }
      },
      child: SafeArea(
        minimum: EdgeInsets.only(left: 35, right: 35, bottom: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: getAvailableHeight(),
            child: Column(
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Start understanding your financials with us',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(14),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50)),
                SignUpForm(),
                ElevatedButton(
                    onPressed: () {
                      toast(
                        context: context,
                        text: 'lorem iposum nevade sigman gg',
                        backgroundColor: kErrorColor,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                      );
                    },
                    child: Container()),
                SizedBox(height: getProportionateScreenHeight(25)),
                CentralDivider(
                  text: 'Or continue with',
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'assets/icons/google.svg',
                      onTap: () {},
                      color: Color(0xFFE6E6E6),
                    ),
                    SocialCard(
                      icon: 'assets/icons/facebook.svg',
                      onTap: () {},
                      color: Color(0xFF475993),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: getProportionateScreenHeight(25),
                  ),
                  child: EasyRichText(
                    'Already have an account? Log In',
                    defaultStyle: TextStyle(
                      fontSize: getProportionateScreenHeight(14),
                      color: kTextColor,
                    ),
                    patternList: [
                      EasyRichTextPattern(
                        targetString: 'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.read<AuthCubit>().showLogin();
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
