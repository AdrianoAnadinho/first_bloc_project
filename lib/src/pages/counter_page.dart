import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/counter_cubit.dart';

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
      body: BodyWidget(cubit: _cubit, textTheme: textTheme),
      floatingActionButton: ButtonWidget(cubit: _cubit),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required CounterCubit cubit,
    required this.textTheme,
  })  : _cubit = cubit,
        super(key: key);

  final CounterCubit _cubit;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CounterCubit, int>(
        bloc: _cubit,
        builder: (context, state) {
          return Text(
            '$state',
            style: textTheme.headline2,
          );
        },
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required CounterCubit cubit,
  })  : _cubit = cubit,
        super(key: key);

  final CounterCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
