import 'package:flutter/cupertino.dart';
import 'package:statistics_c/Sort/sort.dart';

import 'package:statistics_c/statistics_helper/s_data.dart';

class Quartiles {
  final Type type;
  final int quartiles;
  final List<IndividualSeriesData> idata;
  final List<DiscreteSeriesData> data;
  final List<ContinuousSeriesData> cdata;
  Quartiles(
      {@required this.quartiles,
      @required this.type,
      this.idata,
      this.data,
      this.cdata});
  double get clac {
    if (type == Type.Continuous) {
      return _calcContinuousQuartiles;
    }
    if (type == Type.Discrete) {
      return _getCalcDiscreteQuartiles;
    }
    if (type == Type.Individual) {
      return _calcIndividualQuartiles;
    }

    return null;
  }

  double get _getCalcDiscreteQuartiles {
    List<double> cf = [];
    double sum = 0;
    for (var item in data) {
      sum += item.frequency;
      cf.add(sum);
    }
    double md = (quartiles * (sum + 1)) / 4;

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

  double get _calcIndividualQuartiles {
    final d = <double>[];
    if (idata == null) return null;
    for (var item in idata) {
      d.add(item.data);
    }
    Sort asc = new Sort(data: d, desc: false);
    List arrData = <double>[];
    arrData = asc.sorting;

    final md = (quartiles * (idata.length + 1)) / 4;
    if (md.toString().contains('.5')) {
      return (arrData[md.toInt() - 1] + arrData[md.toInt()]) / 2;
    }
    return arrData[md.toInt() - 1];
  }

  double get _calcContinuousQuartiles {
    List<double> cf = [];
    double sum = 0;
    double md;
    for (var item in cdata) {
      sum += item.frequency;
      cf.add(sum);
    }
    if (quartiles == 1) {
      md = sum / 4;
    } else {
      md = (sum * 3) / 4;
    }

    return actualQuartiles(cf, cdata, md);
  }
}

double actualQuartiles(
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

  double actualQ = ((md - cF) * h) / f;
  return actualQ + double.parse(classInterval[0]);
}

class FirstQuartilesIndividualSeries extends Quartiles {
  final List<IndividualSeriesData> idata;
  FirstQuartilesIndividualSeries({@required this.idata});
  double get calc {
    return Quartiles(
      quartiles: 1,
      type: Type.Individual,
      idata: idata,
    ).clac;
  }
}

class FirstQuartilesDiscreteSeries extends Quartiles {
  final List<DiscreteSeriesData> data;
  FirstQuartilesDiscreteSeries({@required this.data});
  double get calc {
    return Quartiles(
      quartiles: 1,
      type: Type.Discrete,
      data: data,
    ).clac;
  }
}

class FirstQuartilesContinousSeries extends Quartiles {
  final List<ContinuousSeriesData> cdata;
  FirstQuartilesContinousSeries({@required this.cdata});
  double get calc {
    return Quartiles(
      quartiles: 1,
      type: Type.Continuous,
      cdata: cdata,
    ).clac;
  }
}

class ThirdQuartilesIndividualSeries extends Quartiles {
  final List<IndividualSeriesData> idata;
  ThirdQuartilesIndividualSeries({@required this.idata});
  double get calc {
    return Quartiles(
      quartiles: 3,
      type: Type.Individual,
      idata: idata,
    ).clac;
  }
}

class ThirdQuartilesDiscreteSeries extends Quartiles {
  final List<DiscreteSeriesData> data;
  ThirdQuartilesDiscreteSeries({@required this.data});
  double get calc {
    return Quartiles(
      quartiles: 3,
      type: Type.Discrete,
      data: data,
    ).clac;
  }
}

class ThirdQuartilesContinousSeries extends Quartiles {
  final List<ContinuousSeriesData> cdata;
  ThirdQuartilesContinousSeries({@required this.cdata});
  double get calc {
    return Quartiles(
      quartiles: 3,
      type: Type.Continuous,
      cdata: cdata,
    ).clac;
  }
}
