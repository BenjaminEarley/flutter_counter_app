import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter/model/CounterModel.dart';

import 'data/Counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _counterModel = CounterModel();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _counterModel),
        StreamProvider(
          initialData: CounterModel.defaultState,
          builder: (BuildContext context) {
            return _counterModel.getCount();
          },
        ),
      ],
      child: MaterialApp(
        home: const MyHomePage(),
      ),
    );
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
    final counter = Provider.of<CounterModel>(context, listen: false);
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
    final counter = Provider.of<Counter>(context);
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
    final counter = Provider.of<Counter>(context);
    return Text("Tapped ${counter.count} times");
  }
}
