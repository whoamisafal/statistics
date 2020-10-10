import 'package:statistics_c/Sort/sort.dart';
import 'package:statistics_c/statistics_helper/s_data.dart';
import 'package:flutter/material.dart';

class Range {
  final Type type;
  final List<IndividualSeriesData> idata;
  Range({@required this.type, @required this.idata});
  double get calcrange {
    if (type == Type.Individual) {
      return _indvidual(0);
    }
    return null;
  }

  double get calcCoefficientrange {
    if (type == Type.Individual) {
      return _indvidual(1);
    }
    return null;
  }

  double _indvidual(int i) {
    final data = <double>[];
    for (var d in idata) {
      data.add(d.data);
    }
    Sort asc = new Sort(data: data, desc: false);
    List da = <double>[];

    da = asc.sorting;

    if (da == null) return null;
    print(da.length);
    double l = da[da.length - 1];
    double s = da[0];
    if (i == 0) {
      return _r(l, s);
    }
    return _coeff(l, s);
  }

  double _r(double l, double s) {
    return l - s;
  }

  double _coeff(double l, double s) {
    return (l - s) / (l + s);
  }
}

class RangeIndividual {
  final List<IndividualSeriesData> idata;
  RangeIndividual({@required this.idata});
}
