import 'package:bloc_project/network/api_client.dart';
import 'package:bloc_project/utils/logger/provider_logger.dart';
import 'package:bloc_project/utils/router/all_router.dart';
import 'package:bloc_project/utils/router/routes.dart';
import 'package:bloc_project/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  /// Initialize Api Client
  ApiClient().initializeClient();

  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AllRouter.generateRoute,
      initialRoute: Routes.homeView,
      // home: HomeView(),
    );
  }
}
