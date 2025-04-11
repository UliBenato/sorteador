import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorteador/pages/insert_data.dart';
import 'package:sorteador/pages/sorteio_result.dart';
import 'package:sorteador/sort_controller.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SORTController(),
      child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sorteador',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InsertData(),
        '/sorteioresult': (context) => SorteioResult(),
      },
    );
  }
}
