import 'package:deeplink_flutter_example/green.dart';
import 'package:deeplink_flutter_example/red.dart';
import 'package:deeplink_flutter_example/services/context_utility.dart';
import 'package:deeplink_flutter_example/services/uni_services.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UniServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtility.navigatorKey,
      title: 'Flutter Unilinking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (_) => const InitialScreen(),
        '/green': (_) => GreenScreen(),
        '/red': (_) => RedScreen(),
      },
    );
  }
}

class InitialScreen extends StatelessWidget{
  const InitialScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
  
}
