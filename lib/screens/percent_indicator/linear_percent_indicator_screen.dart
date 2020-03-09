import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LinearPercentIndicatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Percent Indicators'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: LinearPercentIndicator(
                width: 140,
                lineHeight: 14,
                percent: 0.5,
                center: const Text(
                  '50%',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Icon(Icons.mood),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: LinearPercentIndicator(
                width: 170,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20,
                leading: const Text('left content'),
                trailing: const Text('right content'),
                percent: 0.2,
                center: const Text('20%'),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20,
                animationDuration: 2000,
                percent: 0.9,
                center: const Text('90%'),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20,
                animationDuration: 2500,
                percent: 0.8,
                center: const Text('80%'),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  LinearPercentIndicator(
                    width: 100,
                    lineHeight: 8,
                    percent: 0.2,
                    progressColor: Colors.red,
                  ),
                  LinearPercentIndicator(
                    width: 100,
                    lineHeight: 8,
                    percent: 0.5,
                    progressColor: Colors.orange,
                  ),
                  LinearPercentIndicator(
                    width: 100,
                    lineHeight: 8,
                    percent: 0.9,
                    progressColor: Colors.blue,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
