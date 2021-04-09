import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<int> {
  SplashCubit() : super(0);

  final List<Map<String, String>> splashData = [
    {
      'image': 'assets/images/splash_1.svg',
      'title': 'Safe and Secure',
      'text':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    },
    {
      'image': 'assets/images/splash_2.svg',
      'title': 'Seamless Integration',
      'text':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    },
    {
      'image': 'assets/images/splash_3.svg',
      'title': 'Powerful Insights',
      'text':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    },
    {
      'image': 'assets/images/splash_4.svg',
      'title': 'Carefree Automation',
      'text':
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
    }
  ];

  void pageChanged(value) => emit(value);
}
