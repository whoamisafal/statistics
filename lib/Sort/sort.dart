import 'package:flutter/material.dart';

class Sort {
  final List<double> data;
  final bool desc;
  Sort({@required this.data, @required this.desc});
  List<double> get sorting {
    if (desc) {
      return decr;
    }

    return asc;
  }

  List<double> get asc {
    double temp;
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < i; j++) {
        //
        if (data[i] < data[j]) {
          temp = data[i];
          data[i] = data[j];
          data[j] = temp;
        }
      }
    }
    return data;
  }

  List<double> get decr {
    double temp;
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < i; j++) {
        //
        if (data[i] > data[j]) {
          temp = data[i];
          data[i] = data[j];
          data[j] = temp;
        }
      }
    }
    return data;
  }
}
