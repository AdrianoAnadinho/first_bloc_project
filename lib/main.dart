import 'package:bloc/bloc.dart';
import 'package:first_bloc_project/src/counter_app.dart';
import 'package:first_bloc_project/src/counter_observer.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = CounterObserver();

  runApp(const CounterApp());
}
