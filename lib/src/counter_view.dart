import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late CounterCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = CounterCubit();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          bloc: _cubit,
          builder: (context, state) {
            return Text(
              '$state',
              style: textTheme.headline2,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: UniqueKey(),
            child: const Icon(Icons.add),
            onPressed: () => _cubit.increment(),
          ),
          FloatingActionButton(
            key: UniqueKey(),
            child: const Icon(Icons.remove),
            onPressed: () => _cubit.decrement(),
          )
        ],
      ),
    );
  }
}
