import 'package:flutter_test/flutter_test.dart';
import 'package:statistics_c/statistics_helper/s_data.dart';
import 'package:statistics_c/statistics/measure_of_centeral_tendency/quartiles.dart';

void main() {
  test('adds one to input values', () {
    //List<DiscreteSeriesData> data = [
    //  new DiscreteSeriesData(data: 20, frequency: 5),
    // new DiscreteSeriesData(data: 22, frequency: 7),
    //  new DiscreteSeriesData(data: 23, frequency: 11),
    //  new DiscreteSeriesData(data: 24, frequency: 9),
    //  new DiscreteSeriesData(data: 25, frequency: 3),
    //  new DiscreteSeriesData(data: 27, frequency: 2)
    // ];
    //DiscreteMean mean = new DiscreteMean(data: data);
    //print(mean.calc.toString());
    List<DiscreteSeriesData> data = [
      new DiscreteSeriesData(data: 13, frequency: 2),
      new DiscreteSeriesData(data: 14, frequency: 3),
      new DiscreteSeriesData(data: 15, frequency: 7),
      new DiscreteSeriesData(data: 16, frequency: 9),
      new DiscreteSeriesData(data: 17, frequency: 3),
      new DiscreteSeriesData(data: 18, frequency: 5),
      new DiscreteSeriesData(data: 19, frequency: 1),
    ];
    FirstQuartilesDiscreteSeries md =
        new FirstQuartilesDiscreteSeries(data: data);
    print(md.calc);
  });
}
