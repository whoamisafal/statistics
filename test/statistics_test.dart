import 'package:flutter_test/flutter_test.dart';
import 'package:statistics_c/statistics/measure_of_dispersion/mean_deviation.dart';
import 'package:statistics_c/statistics/measure_of_dispersion/standard_deviation.dart';

import 'package:statistics_c/statistics_helper/s_data.dart';

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
    /* List<ContinuousSeriesData> cdata = [
      new ContinuousSeriesData(classInterval: "0-10", frequency: 5),
      new ContinuousSeriesData(classInterval: "10-20", frequency: 8),
      new ContinuousSeriesData(classInterval: "20-30", frequency: 7),
      new ContinuousSeriesData(classInterval: "30-40", frequency: 12),
      new ContinuousSeriesData(classInterval: "40-50", frequency: 28),
      new ContinuousSeriesData(classInterval: "50-60", frequency: 20),
      new ContinuousSeriesData(classInterval: "60-70", frequency: 10),
    ];*/
    /* List<IndividualSeriesData> idata = [
      new IndividualSeriesData(data: 15),
      new IndividualSeriesData(data: 16),
      new IndividualSeriesData(data: 18),
      new IndividualSeriesData(data: 14),
      new IndividualSeriesData(data: 20),
      new IndividualSeriesData(data: 26),
      new IndividualSeriesData(data: 17),
    ];*/
    List<ContinuousSeriesData> cdata = [
      new ContinuousSeriesData(classInterval: "0-10", frequency: 4),
      new ContinuousSeriesData(classInterval: "10-20", frequency: 6),
      new ContinuousSeriesData(classInterval: "20-30", frequency: 8),
      new ContinuousSeriesData(classInterval: "30-40", frequency: 10),
      new ContinuousSeriesData(classInterval: "40-50", frequency: 4),
      new ContinuousSeriesData(classInterval: "50-60", frequency: 8),
    ];

    /* List<DiscreteSeriesData> data = [
      new DiscreteSeriesData(data: 115, frequency: 4),
      new DiscreteSeriesData(data: 120, frequency: 7),
      new DiscreteSeriesData(data: 125, frequency: 10),
      new DiscreteSeriesData(data: 130, frequency: 13),
      new DiscreteSeriesData(data: 135, frequency: 10),
      new DiscreteSeriesData(data: 140, frequency: 7),
      new DiscreteSeriesData(data: 145, frequency: 4),
    ];*/
    /* List<IndividualSeriesData> idata = [
      new IndividualSeriesData(data: 23),
      new IndividualSeriesData(data: 22),
      new IndividualSeriesData(data: 20),
      new IndividualSeriesData(data: 24),
      new IndividualSeriesData(data: 16),
      new IndividualSeriesData(data: 18),
      new IndividualSeriesData(data: 19),
      new IndividualSeriesData(data: 21),
      new IndividualSeriesData(data: 17),
    ];*/
    /*List<DiscreteSeriesData> data = [
      new DiscreteSeriesData(data: 24, frequency: 3),
      new DiscreteSeriesData(data: 26, frequency: 7),
      new DiscreteSeriesData(data: 30, frequency: 6),
      new DiscreteSeriesData(data: 31, frequency: 10),
      new DiscreteSeriesData(data: 34, frequency: 5),
      new DiscreteSeriesData(data: 36, frequency: 4),
      new DiscreteSeriesData(data: 37, frequency: 3),
      new DiscreteSeriesData(data: 38, frequency: 2),
    ];*/

    SDContinuous md = new SDContinuous(cdata: cdata);

    print(md.sd);
  });
}
