import 'package:statistics_c/statistics/measure_of_centeral_tendency/quartiles.dart';
import 'package:statistics_c/statistics_helper/s_data.dart';
import 'package:flutter/material.dart';

class QD {
  final Type type;
  final int find;
  final List<IndividualSeriesData> idata;
  final List<DiscreteSeriesData> data;
  final List<ContinuousSeriesData> cdata;
  QD(
      {@required this.type,
      this.idata,
      this.data,
      this.cdata,
      @required this.find});

  double get calc {
    if (type == Type.Individual) {
      return _findIndividualQD;
    }
    if (type == Type.Discrete) {
      return _findDiscreteQD;
    }
    if (type == Type.Continuous) {
      return _findContinuoesQD;
    }

    return null;
  }

  double get _findIndividualQD {
    FirstQuartilesIndividualSeries individualSeries1 =
        new FirstQuartilesIndividualSeries(idata: idata);
    ThirdQuartilesIndividualSeries individualSeries3 =
        new ThirdQuartilesIndividualSeries(idata: idata);

    double q1 = individualSeries1.calc;
    double q3 = individualSeries3.calc;
    if (find == 0) {
      return _findIQd(q1, q3);
    }

    return _findICQd(q1, q3);
  }

  double _findIQd(double q1, double q3) {
    return (q3 - q1) / 2;
  }

  double _findICQd(double q1, double q3) {
    return (q3 - q1) / (q3 + q1);
  }

  double get _findDiscreteQD {
    FirstQuartilesDiscreteSeries data1 =
        new FirstQuartilesDiscreteSeries(data: data);
    ThirdQuartilesDiscreteSeries data3 =
        new ThirdQuartilesDiscreteSeries(data: data);

    double q1 = data1.calc;
    double q3 = data3.calc;
    if (find == 0) {
      return _findIQd(q1, q3);
    }

    return _findICQd(q1, q3);
  }

  double get _findContinuoesQD {
    FirstQuartilesContinousSeries data1 =
        new FirstQuartilesContinousSeries(cdata: cdata);
    ThirdQuartilesContinousSeries data3 =
        new ThirdQuartilesContinousSeries(cdata: cdata);

    double q1 = data1.calc;
    double q3 = data3.calc;
    if (find == 0) {
      return _findIQd(q1, q3);
    }

    return _findICQd(q1, q3);
  }
}

class QDIndividual extends QD {
  final List<IndividualSeriesData> idata;
  QDIndividual({@required this.idata});
  double get qd {
    return QD(find: 0, type: Type.Individual, idata: idata).calc;
  }

  double get coefficientQD {
    return QD(find: 1, type: Type.Individual, idata: idata).calc;
  }
}

class QDiscrete extends QD {
  final List<DiscreteSeriesData> data;
  QDiscrete({@required this.data});
  double get qd {
    return QD(find: 0, type: Type.Discrete, data: data).calc;
  }

  double get coefficientQD {
    return QD(find: 1, type: Type.Discrete, data: data).calc;
  }
}

class QDContinuous extends QD {
  final List<ContinuousSeriesData> cdata;
  QDContinuous({@required this.cdata});
  double get qd {
    return QD(find: 0, type: Type.Continuous, cdata: cdata).calc;
  }

  double get coefficientQD {
    return QD(find: 1, type: Type.Continuous, cdata: cdata).calc;
  }
}
