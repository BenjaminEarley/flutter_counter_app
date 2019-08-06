import 'package:counter/repository/counter_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/counter/counter_state.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<CounterBloc>(
      builder: (context) => CounterBloc(CounterRepository()),
      dispose: (context, value) => value.dispose(),
      child: Scaffold(
        appBar: AppBar(title: const Title()),
        body: const Center(child: CounterLabel()),
        floatingActionButton: const IncrementCounterButton(),
      ),
    );
  }
}

class IncrementCounterButton extends StatelessWidget {
  const IncrementCounterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterBloc>(context);
    return FloatingActionButton(
      onPressed: counter.increment,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class CounterLabel extends StatelessWidget {
  const CounterLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterBloc>(context);
    return StreamBuilder<CounterState>(
      stream: counter.stream,
      builder: (context, snapshot) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${snapshot.data?.count}',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterBloc>(context);
    return StreamBuilder<CounterState>(
        stream: counter.stream,
        builder: (context, snapshot) =>
            Text("Tapped ${snapshot.data?.count} times"));
  }
}
