import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/job_provider.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => JobProvider())],
      child: const MaterialApp(
        title: "Job App",
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
