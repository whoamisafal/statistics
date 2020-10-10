import 'dart:math';

import 'package:statistics_c/statistics/measure_of_centeral_tendency/mean.dart';
import 'package:statistics_c/statistics_helper/s_data.dart';
import 'package:flutter/material.dart';

class SD {
  final Type type;
  final int find;
  final List<IndividualSeriesData> idata;
  final List<DiscreteSeriesData> data;
  final List<ContinuousSeriesData> cdata;
  SD(
      {@required this.type,
      this.idata,
      this.data,
      this.cdata,
      @required this.find});

  double get calc {
    if (type == Type.Individual) {
      return _individualSD;
    }
    if (type == Type.Discrete) {
      return _discreteSD;
    }
    if (type == Type.Continuous) {
      return _continuoteSD;
    }
    return null;
  }

  double get _individualSD {
    IndividualMean mean = new IndividualMean(idata: idata);
    double actualMean = mean.calc;
    double sum = 0;

    for (var item in idata) {
      double res = pow(item.data - actualMean, 2);
      sum += res;
    }
    if (find == 0) {
      return _findSD(sum, idata.length);
    }
    double sd = _findSD(sum, idata.length);

    return _cofficientofVarience(actualMean, sd);
  }

  double _findSD(double sum, int n) {
    return sqrt((sum / n));
  }

  double _cofficientofVarience(double mean, double sd) {
    return (sd / mean) * 100;
  }

  double get _discreteSD {
    DiscreteMean mean = new DiscreteMean(data: data);
    double actualMean = mean.calc;

    double sum = 0;
    int n = 0;

    for (var item in data) {
      double d = item.data - actualMean;
      print(d);
      double res = item.frequency * pow(d, 2);
      sum += res;
      n += item.frequency.toInt();
    }
    if (find == 0) {
      return _findSD(sum, n);
    }
    double sd = _findSD(sum, n);

    return _cofficientofVarience(actualMean, sd);
  }

  double get _continuoteSD {
    ContinuousMean mean = new ContinuousMean(cdata: cdata);
    double actualMean = mean.calc;
    print(actualMean);
    double sum = 0;
    int n = 0;
    List midValue = <double>[];
    for (int i = 0; i < cdata.length; i++) {
      List<String> splitData = cdata[i].classInterval.split('-');
      double lower = double.parse(splitData[0]);
      double higher = double.parse(splitData[1]);
      midValue.add((lower + higher) / 2);
      // print('Mid Value ' + midValue[i].toString());
    }

    // calculate sum and n

    for (int i = 0; i < cdata.length; i++) {
      double d = midValue[i] - actualMean;
      sum += cdata[i].frequency * pow(d, 2);
      n += cdata[i].frequency.toInt();
    }
    if (find == 0) {
      return _findSD(sum, n);
    }
    double sd = _findSD(sum, n);

    return _cofficientofVarience(actualMean, sd);
  }
}

class SDIndividual extends SD {
  final List<IndividualSeriesData> idata;
  SDIndividual({@required this.idata});
  double get sd {
    return SD(find: 0, type: Type.Individual, idata: idata).calc;
  }

  double get coefficientofvarience {
    return SD(find: 1, type: Type.Individual, idata: idata).calc;
  }
}

class SDiscrete extends SD {
  final List<DiscreteSeriesData> data;
  SDiscrete({@required this.data});
  double get sd {
    return SD(find: 0, type: Type.Discrete, data: data).calc;
  }

  double get coefficientofvarience {
    return SD(find: 1, type: Type.Discrete, data: data).calc;
  }
}

class SDContinuous extends SD {
  final List<ContinuousSeriesData> cdata;
  SDContinuous({@required this.cdata});
  double get sd {
    return SD(find: 0, type: Type.Continuous, cdata: cdata).calc;
  }

  double get coefficientofvarience {
    return SD(find: 1, type: Type.Continuous, cdata: cdata).calc;
  }
}
