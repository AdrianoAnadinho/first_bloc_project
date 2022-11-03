import 'package:first_bloc_project/src/pages/counter_page.dart';
import 'package:flutter/material.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterView(),
    );
  }
}
