import 'package:statistics_c/statistics/measure_of_centeral_tendency/mean.dart';
import 'package:statistics_c/statistics_helper/s_data.dart';
import 'package:flutter/material.dart';

class MD {
  final Type type;
  final int find;
  final List<IndividualSeriesData> idata;
  final List<DiscreteSeriesData> data;
  final List<ContinuousSeriesData> cdata;
  MD(
      {@required this.type,
      this.idata,
      this.data,
      this.cdata,
      @required this.find});

  double get calc {
    if (type == Type.Individual) {
      return _individualMD;
    }
    if (type == Type.Discrete) {
      return _discreteMD;
    }
    if (type == Type.Continuous) {
      return _continiousMD;
    }
    return null;
  }

  double get _individualMD {
    IndividualMean mean = new IndividualMean(idata: idata);
    double actualMean = mean.calc;
    double sum = 0;
    List d = <double>[]; // d=|x-mean|
    for (var item in idata) {
      double res = (item.data - actualMean).abs();
      d.add(res);
      sum += res;
    }
    if (find == 0) {
      return _md(sum, idata.length);
    }
    double mD = _md(sum, idata.length);
    return _coefficientOfMd(actualMean, mD);
  }

  double _md(double sum, int n) {
    return sum / n;
  }

  double _coefficientOfMd(double mean, double md) {
    return md / mean;
  }

  double get _discreteMD {
    DiscreteMean mean = new DiscreteMean(data: data);
    double actualMean = mean.calc;

    int n = 0;
    double fd = 0;
    List d = <double>[]; // d=|x-mean|
    for (var item in data) {
      double res = (item.data - actualMean).abs();
      d.add(res);
    }
    // find n
    for (var item in data) {
      n += item.frequency.toInt();
    }
    // find fd
    for (int i = 0; i < d.length; i++) {
      fd += d[i] * data[i].frequency;
    }
    if (find == 0) {
      return _md(fd, n);
    }
    double mD = _md(fd, n);
    return _coefficientOfMd(actualMean, mD);
  }

  double get _continiousMD {
    ContinuousMean mean = new ContinuousMean(cdata: cdata);
    double actualMean = mean.calc;
    List<String> splitData;
    List midValue = <double>[];
    int n = 0;
    double fd = 0;

    for (int i = 0; i < cdata.length; i++) {
      splitData = cdata[i].classInterval.split('-');
      double lower = double.parse(splitData[0]);
      double higher = double.parse(splitData[1]);
      midValue.add((lower + higher) / 2);
      // print('Mid Value ' + midValue[i].toString());
    }

    List d = <double>[]; // d=|m-mean|
    for (var item in midValue) {
      double res = (item - actualMean).abs();
      d.add(res);
    }
    // find n
    for (var item in cdata) {
      n += item.frequency.toInt();
    }
    // find fd
    for (int i = 0; i < d.length; i++) {
      fd += d[i] * cdata[i].frequency;
    }
    if (find == 0) {
      return _md(fd, n);
    }
    double mD = _md(fd, n);
    return _coefficientOfMd(actualMean, mD);
  }
}

class MDIndividual {
  final List<IndividualSeriesData> idata;
  MDIndividual({@required this.idata});
  double get md {
    return MD(find: 0, type: Type.Individual, idata: idata).calc;
  }

  double get coefficientMD {
    return MD(find: 1, type: Type.Individual, idata: idata).calc;
  }
}

class MDiscrete {
  final List<DiscreteSeriesData> data;
  MDiscrete({@required this.data});
  double get md {
    return MD(find: 0, type: Type.Discrete, data: data).calc;
  }

  double get coefficientMD {
    return MD(find: 1, type: Type.Discrete, data: data).calc;
  }
}

class MDContinuous {
  final List<ContinuousSeriesData> cdata;
  MDContinuous({@required this.cdata});
  double get md {
    return MD(find: 0, type: Type.Continuous, cdata: cdata).calc;
  }

  double get coefficientMD {
    return MD(find: 1, type: Type.Continuous, cdata: cdata).calc;
  }
}
