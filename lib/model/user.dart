import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class User {
  String email;
  String password;
  bool verified = false;

  User({this.email});

  /// Decode user from Cognito User Attributes
  factory User.fromUserAttributes(List<CognitoUserAttribute> attributes) {
    final user = User();
    attributes.forEach((attribute) {
      if (attribute.getName() == 'email') {
        user.email = attribute.getValue();
      } else if (attribute.getName().toLowerCase().contains('verified')) {
        if (attribute.getValue().toLowerCase() == 'true') {
          user.verified = true;
        }
      }
    });
    return user;
  }
}
