import 'package:flutter/cupertino.dart';
import 'package:statistics_c/Sort/sort.dart';

import 'package:statistics_c/statistics_helper/s_data.dart';

class Median {
  final Type type;
  final List<IndividualSeriesData> idata;
  final List<DiscreteSeriesData> data;
  final List<ContinuousSeriesData> cdata;
  Median({@required this.type, this.idata, this.data, this.cdata});
  double get clac {
    if (type == Type.Continuous) {
      return _calcContinuousMedian;
    }
    if (type == Type.Discrete) {
      return _getCalcDiscreteMedian;
    }
    if (type == Type.Individual) {
      return _calcIndividualMedian;
    }

    return null;
  }

  double get _getCalcDiscreteMedian {
    List<double> cf = [];
    double sum = 0;
    for (var item in data) {
      sum += item.frequency;
      cf.add(sum);
    }
    double md = (sum + 1) / 2;

    return actualMd(cf, md);
  }

  double actualMd(List<double> cf, double md) {
    double result;
    for (int i = 0; i < cf.length; i++) {
      if (md == cf[i]) {
        result = data[i].data;
        break;
      } else if (md < cf[i]) {
        if (md.toString().contains('.5')) {
          result = (data[i].data + data[i - 1].data) / 2;
          break;
        } else {
          result = data[i].data;
          break;
        }
      }
    }
    return result;
  }

  double get _calcIndividualMedian {
    final d = <double>[];
    if (idata == null) return null;
    for (var item in idata) {
      d.add(item.data);
    }
    Sort asc = new Sort(data: d, desc: false);
    List arrData = <double>[];
    arrData = asc.sorting;
    final md = (idata.length + 1) / 2;
    if (md.toString().contains('.5')) {
      return (arrData[md.toInt() - 1] + arrData[md.toInt()]) / 2;
    }
    return arrData[md.toInt() - 1];
  }

  double get _calcContinuousMedian {
    List<double> cf = [];
    double sum = 0;
    for (var item in cdata) {
      sum += item.frequency;
      cf.add(sum);
    }
    double md = sum / 2;
    return actualMedian(cf, cdata, md);
  }
}

double actualMedian(List<double> cf, List<ContinuousSeriesData> d, double md) {
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

class IndividualMedian extends Median {
  final List<IndividualSeriesData> idata;
  IndividualMedian({@required this.idata});
  double get calc {
    return Median(type: Type.Individual, idata: idata).clac;
  }
}

class DiscreteMedian extends Median {
  final List<DiscreteSeriesData> data;
  DiscreteMedian({@required this.data});
  double get calc {
    return Median(type: Type.Discrete, data: data).clac;
  }
}

class ContinuousMedian extends Median {
  final List<ContinuousSeriesData> cdata;
  ContinuousMedian({@required this.cdata});
  double get calc {
    return Median(type: Type.Continuous, cdata: cdata).clac;
  }
}
