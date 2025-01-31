import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/login_screen.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'viewmodels/home_view_model.dart';
import 'viewmodels/login_viewmodel.dart';
import 'repositories/main_repository.dart';
import 'services/main_api_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => MainApiService()),
        ProxyProvider<MainApiService, MainRepository>(
          update: (_, mainApiService, __) => MainRepository(mainApiService),
        ),
        ChangeNotifierProxyProvider<MainRepository, HomeViewModel>(
          create: (_) => HomeViewModel(MainRepository(MainApiService())),
          update: (_, mainRepository, __) => HomeViewModel(mainRepository),
        ),
        ChangeNotifierProxyProvider<MainRepository, LoginViewModel>(
          create: (_) => LoginViewModel(MainRepository(MainApiService())),
          update: (_, mainRepository, __) => LoginViewModel(mainRepository),
        ),
      ],
      child: const TripazApp(),
    ),
  );
}

class TripazApp extends StatelessWidget {
  const TripazApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
