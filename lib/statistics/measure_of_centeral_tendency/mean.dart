import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statistics_c/statistics_helper/s_data.dart';

class Mean {
  final Type type;
  final List<IndividualSeriesData> idata;
  final List<DiscreteSeriesData> data;
  final List<ContinuousSeriesData> cdata;
  Mean({@required this.type, this.idata, this.data, this.cdata});

  double get calc {
    if (type == Type.Continuous) {
      return _calcContinuous;
    }
    if (type == Type.Discrete) {
      return _calcDiscrete;
    }
    if (type == Type.Individual) {
      return _calcIndividal;
    }
    return null;
  }

// Individual series
  double get _calcIndividal {
    double sum = 0;
    int n;
    if (idata != null)
      n = idata.length;
    else
      return null;

    for (int i = 0; i < idata.length; i++) {
      sum += idata[i].data;
    }
    // calculation of mean
    double result = sum / n;
    return result;
  }

  double get _calcDiscrete {
    double totalfx = 0;
    double n = 0;
    if (data == null) return null;

    // finding total fx
    for (int i = 0; i < data.length; i++) {
      totalfx += data[i].data * data[i].frequency;
      n += data[i].frequency;
    }
// Calculation
    double result = totalfx / n;

    return result;
  }

  double get _calcContinuous {
    double totalFm = 0;
    double n = 0;
    List<String> splitData;
    if (cdata == null) return null;
    List<double> midValue = [];

    List<String> data1 = cdata[0].classInterval.split('-');
    List<String> data2 = cdata[1].classInterval.split('-');
    // double firstClass_lower = double.parse(data1[0]);
    double firstClassmax = double.parse(data1[1]);
    double secondClasslower = double.parse(data2[0]);
    // double secondClass_max = double.parse(data2[1]);
    double res = secondClasslower - firstClassmax;
    if (res.toInt() == 0) {
      // getting mid value

      for (int i = 0; i < cdata.length; i++) {
        splitData = cdata[i].classInterval.split('-');
        double lower = double.parse(splitData[0]);
        double higher = double.parse(splitData[1]);
        midValue.add((lower + higher) / 2);
        // print('Mid Value ' + midValue[i].toString());
      }
      // finding fm
      for (int i = 0; i < midValue.length; i++) {
        totalFm += midValue[i] * cdata[i].frequency;
        n += cdata[i].frequency;
        //print(n.toString());
      }

      // calculate
      double res = totalFm / n;
      return res;
    } else {
      //
    }

    return null;
  }

  get checkContinuousDataFormat {
    return true;
  }
}

class IndividualMean extends Mean {
  final List<IndividualSeriesData> idata;
  IndividualMean({@required this.idata});
  double get calc {
    return Mean(type: Type.Individual, idata: idata).calc;
  }
}

class ContinuousMean extends Mean {
  final List<ContinuousSeriesData> cdata;
  ContinuousMean({@required this.cdata});
  double get calc {
    return Mean(type: Type.Continuous, cdata: cdata).calc;
  }
}

class DiscreteMean extends Mean {
  final List<DiscreteSeriesData> data;
  DiscreteMean({@required this.data});
  double get calc {
    return Mean(type: Type.Discrete, data: data).calc;
  }
}
