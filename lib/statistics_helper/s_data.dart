import 'package:flutter/cupertino.dart';

enum Type { Individual, Discrete, Continuous }

class IndividualSeriesData {
  final double data;
  IndividualSeriesData({@required this.data});
}

class DiscreteSeriesData {
  final double data;
  final double frequency;
  DiscreteSeriesData({@required this.data, @required this.frequency});
}

class ContinuousSeriesData {
  final String classInterval;
  final double frequency;
  ContinuousSeriesData(
      {@required this.classInterval, @required this.frequency});
}
