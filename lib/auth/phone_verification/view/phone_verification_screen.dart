// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../phone_verification_bloc.dart';
// import 'components/body.dart';
// import '../../../auth/auth_navigation/auth_cubit.dart';
// import '../../auth_repository.dart';

// class PhoneVerificationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//         ),
//         body: BlocProvider(
//           create: (context) => PhoneVerificationBloc(
//             authCubit: context.read<AuthCubit>(),
//             authRepo: context.read<AuthRepository>(),
//           ),
//           child: Body(),
//         ),
//       ),
//     );
//   }
// }
