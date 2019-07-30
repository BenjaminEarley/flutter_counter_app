import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/counter/counter_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _counterBloc),
        StreamProvider(
          initialData: CounterBloc.defaultState,
          builder: (BuildContext context) {
            return _counterBloc.stream;
          },
        ),
      ],
      child: MaterialApp(
        home: const MyHomePage(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Title()),
      body: const Center(child: CounterLabel()),
      floatingActionButton: const IncrementCounterButton(),
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
    final counter = Provider.of<CounterState>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '${counter.count}',
          style: Theme.of(context).textTheme.display1,
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterState>(context);
    return Text("Tapped ${counter.count} times");
  }
}
