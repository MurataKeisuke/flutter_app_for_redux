import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularPercentIndicatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Percent Indicators'),
      ),
      body: Center(
        child: ListView(
            children: <Widget>[
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 10,
                percent: 0.8,
                header: const Text('Icon header'),
                center: Icon(
                  Icons.person_pin,
                  size: 50,
                  color: Colors.blue,
                ),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
              CircularPercentIndicator(
                radius: 130,
                animation: true,
                animationDuration: 1200,
                lineWidth: 15,
                percent: 0.4,
                center: Text(
                  '40 hours',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.yellow,
                progressColor: Colors.red,
              ),
              CircularPercentIndicator(
                radius: 120,
                lineWidth: 13,
                animation: true,
                percent: 0.7,
                center: Text(
                  '70%',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                footer: Text(
                  'Sales this week',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.purple,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: CircularPercentIndicator(
                  radius: 60,
                  lineWidth: 5,
                  percent: 1,
                  center: const Text('100%'),
                  progressColor: Colors.green,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularPercentIndicator(
                      radius: 45,
                      lineWidth: 4,
                      percent: 0.10,
                      center: const Text('10%'),
                      progressColor: Colors.red,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    CircularPercentIndicator(
                      radius: 45,
                      lineWidth: 4,
                      percent: 0.30,
                      center: const Text('30%'),
                      progressColor: Colors.orange,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    CircularPercentIndicator(
                      radius: 45,
                      lineWidth: 4,
                      percent: 0.60,
                      center: const Text('60%'),
                      progressColor: Colors.yellow,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    CircularPercentIndicator(
                      radius: 45,
                      lineWidth: 4,
                      percent: 0.90,
                      center: const Text('90%'),
                      progressColor: Colors.green,
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
