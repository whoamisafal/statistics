import 'package:flutter/cupertino.dart';
import 'package:statistics_c/statistics_helper/s_data.dart';

class Percentiles {
  final int percentiles;
  final List<ContinuousSeriesData> cdata;
  Percentiles({@required this.cdata, @required this.percentiles});

  double get calcContinuousPercentiles {
    if (percentiles >= 100 || percentiles <= 0) {
      return null;
    }
    List<double> cf = [];
    double sum = 0;
    for (var item in cdata) {
      sum += item.frequency;
      cf.add(sum);
    }
    double md = (percentiles * sum) / 100;
    return _actualPercentiles(cf, cdata, md);
  }
}

double _actualPercentiles(
    List<double> cf, List<ContinuousSeriesData> d, double md) {
  int pos;
  for (int i = 0; i < cf.length; i++) {
    if (md == cf[i]) {
      pos = i;
      break;
    } else if (md < cf[i]) {
      pos = i;
      break;
    }
  }
  print(md.toString());
  double f = d[pos].frequency;
  print("Frequency " + f.toString());
  double cF = cf[pos - 1];
  List<String> classInterval = d[pos].classInterval.split('-');
  if (classInterval == null) return null;
  double h = (double.parse(classInterval[1]) - double.parse(classInterval[0]));

  double actualMd = ((md - cF) * h) / f;
  return actualMd + double.parse(classInterval[0]);
}
