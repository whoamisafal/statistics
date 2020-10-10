# statistics

A new Flutter package project.

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


### Example

``` dart 
import 'package:flutter/material.dart';
import 'package:statistics_c/statistics/measure_of_centeral_tendency/mean.dart';
import 'package:statistics_c/statistics/measure_of_centeral_tendency/median.dart';
import 'package:statistics_c/statistics/measure_of_centeral_tendency/quartiles.dart';
import 'package:statistics_c/statistics_helper/s_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Statistics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ContinuousSeriesData> cdata = [
    new ContinuousSeriesData(classInterval: "0-10", frequency: 2),
    new ContinuousSeriesData(classInterval: "10-20", frequency: 5),
    new ContinuousSeriesData(classInterval: "20-30", frequency: 1),
    new ContinuousSeriesData(classInterval: "30-40", frequency: 3),
  ];
  List<IndividualSeriesData> idata = [
    new IndividualSeriesData(data: 5),
    new IndividualSeriesData(data: 15),
    new IndividualSeriesData(data: 7),
    new IndividualSeriesData(data: 8),
    new IndividualSeriesData(data: 5),
    new IndividualSeriesData(data: 9),
  ];
  List<DiscreteSeriesData> data = [
    new DiscreteSeriesData(data: 5, frequency: 2),
    new DiscreteSeriesData(data: 10, frequency: 5),
    new DiscreteSeriesData(data: 20, frequency: 1),
    new DiscreteSeriesData(data: 30, frequency: 3),
    new DiscreteSeriesData(data: 40, frequency: 12),
    new DiscreteSeriesData(data: 50, frequency: 0),
    new DiscreteSeriesData(data: 60, frequency: 5),
    new DiscreteSeriesData(data: 70, frequency: 7),
  ];

  @override
  Widget build(BuildContext context) {
    var textStyle = new TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
    var style = new TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Continious ',
            style: textStyle,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: cdata.length,
              itemBuilder: (context, index) {
                return Text(
                  "Class-Interval " +
                      cdata[index].classInterval +
                      "\t\t\t\tFrequency: " +
                      cdata[index].frequency.toString(),
                  style: style,
                );
              },
            ),
          ),
          Text(
            'Discrete ',
            style: textStyle,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Text(
                  "x " +
                      data[index].data.toString() +
                      "\t\t\t\t\t\t\tf: " +
                      data[index].frequency.toString(),
                  style: style,
                );
              },
            ),
          ),
          Text(
            'Individual  ',
            style: textStyle,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: idata.length,
              itemBuilder: (context, index) {
                return Text(
                  "x " + idata[index].data.toString(),
                  style: style,
                );
              },
            ),
          ),
          Text(
            'Median of Continuous series is ' +
                ContinuousMedian(cdata: cdata).calc.toString(),
            style: textStyle,
          ),
          Text(
            'Median of Discrete series is ' +
                DiscreteMedian(data: data).calc.toString(),
            style: textStyle,
          ),
          Text(
            'Median of Individual series is ' +
                IndividualMedian(idata: idata).calc.toString(),
            style: textStyle,
          ),
          Text(
            'Mean of Continuous series is ' +
                ContinuousMean(cdata: cdata).calc.ceil().toString(),
            style: textStyle,
          ),
          Text(
            'Median of Discrete series is ' +
                DiscreteMean(data: data).calc.toString(),
            style: textStyle,
          ),
          Text(
            'Median of Individual series is ' +
                IndividualMean(idata: idata).calc.toString(),
            style: textStyle,
          ),
          Text(
            'First Quartiles of Continuous series is ' +
                FirstQuartilesContinousSeries(cdata: cdata)
                    .calc
                    .ceil()
                    .toString(),
            style: textStyle,
          ),
          Text(
            'Third Quartiles of Continuous series is ' +
                ThirdQuartilesContinousSeries(cdata: cdata)
                    .calc
                    .ceil()
                    .toString(),
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
```
### Output



(/statistics-/output.png)
Format: ![Alt Text](https://github.com/safalstha142/statistics-/blob/master/output.png)