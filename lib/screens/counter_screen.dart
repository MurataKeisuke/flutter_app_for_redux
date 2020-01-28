import 'package:flutter/material.dart';
import 'package:redux_app/containers/button/increase_counters.dart';
import 'package:redux_app/containers/counter/counter.dart';

class CounterScreen extends StatelessWidget {
  final String title;

  const CounterScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Counter(),
          ],
        ),
      ),
      floatingActionButton: const IncreaseCountButton(),
    );
  }
}
