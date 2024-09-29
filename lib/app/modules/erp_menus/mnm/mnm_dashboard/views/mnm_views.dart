import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../config/app_assets.dart';
import '../controllers/mnm_controller.dart';
import '../models/chart_models.dart';

class MNMViews extends GetView<MNMController> {
  const MNMViews({Key? key}) : super(key: key);

  // late List<_ChartData> data;
  //late TooltipBehavior _tooltip;

  @override
  Widget build(BuildContext context) {
    final List<ChartData> data = [
      ChartData('Nov 23', 13),
      ChartData('Dec 23', 11),
      ChartData('Jan 24', 22),
      ChartData('Feb 24', 18),
      ChartData('Mar 24', 19),
      ChartData('Apr 24', 19),
    ];

    final List<ChartData> data2 = [
      ChartData('Nov 23', 8),
      ChartData('Dec 23', 15),
      ChartData('Jan 24', 32),
      ChartData('Feb 24', 26),
      ChartData('Mar 24', 14),
      ChartData('Apr 24', 14),
    ];

    final List<ChartData> data3 = [
      ChartData('Nov 23', 10),
      ChartData('Dec 23', 12),
      ChartData('Jan 24', 36),
      ChartData('Feb 24', 16),
      ChartData('Mar 24', 18),
      ChartData('Apr 24', 11),
    ];

    final TooltipBehavior tooltip = TooltipBehavior(enable: true);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Image(
              height: 24,
              image: AssetImage(
                AppAssets.PSL_TRANSPARENT_WHITE_LOGO,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Shopno',
                    //controller.user.empName ?? '',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'executive',
                    //controller.user.designation ?? '',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8),
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                      NumericAxis(minimum: 0, maximum: 40, interval: 10),
                  tooltipBehavior: tooltip,
                  title: ChartTitle(
                      text: 'Monthly Confirmed Order and Export with Value'),
                  series: <ChartSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                        dataSource: data,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: 'ORDER QTY (PCS)',
                        color: const Color.fromRGBO(8, 142, 255, 1)),
                    ColumnSeries<ChartData, String>(
                        dataSource: data2,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: 'EXPORT QTY (PCS)',
                        color: Colors.green),
                    ColumnSeries<ChartData, String>(
                        dataSource: data3,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: 'SHORT EXPORT QTY (PCS)',
                        color: Colors.red)
                  ]),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: controller.MNMList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      controller
                          .onClickMNMMenue(controller.MNMList[index].route);
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.fingerprint,
                        color: Colors.black,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.MNMList[index].titile),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}


// class _ChartData {
//   _ChartData(this.x, this.y);
//
//   final String x;
//   final double y;
// }