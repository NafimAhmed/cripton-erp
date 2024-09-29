import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/title_dropdown.dart';
import '../../../../../components/traffic_button.dart';
import '../../../../../components/traffic_button_status.dart';
import '../../../../../utils/screen_size.dart';
import '../controller/tna_traffic_light_controller.dart';

class TNATrafficLightView extends GetView<TNATrafficLightController> {
  const TNATrafficLightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('traffic'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: screenWidth,
              //height: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleDropDown(
                        list: controller.leaveTypeList,
                        title: 'Company',
                        hints: 'Select Company',
                        dropdownHeight: 30,
                        dropdownWidth: screenWidth * 0.20,
                      ),
                      TitleDropDown(
                        list: controller.BuyerList,
                        title: 'Buyer',
                        hints: 'Select Buyer',
                        dropdownHeight: 30,
                        dropdownWidth: screenWidth * 0.20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleDropDown(
                        list: controller.leaveTypeList,
                        title: 'Job No.',
                        hints: 'Select Company',
                        dropdownHeight: 30,
                        dropdownWidth: screenWidth * 0.20,
                      ),
                      TitleDropDown(
                        list: controller.BuyerList,
                        title: 'Style ref.',
                        hints: 'Select Buyer',
                        dropdownHeight: 30,
                        dropdownWidth: screenWidth * 0.20,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      DataTable(
                          columns: const [
                            DataColumn(label: Text('Export order')),
                            DataColumn(label: Text('Order\nReceived')),
                            DataColumn(label: Text('Febric\nBooking')),
                            DataColumn(label: Text('Accesories\nBooking')),
                            DataColumn(label: Text('Sample\nApproval')),
                            DataColumn(label: Text('Sample\nSubmission')),
                            DataColumn(label: Text('Febric\nin house')),
                            DataColumn(label: Text('Accesories\nin house')),
                            DataColumn(label: Text('Lab DIP\nSubmission')),
                            DataColumn(label: Text('Possible\nCut Date')),
                          ],
                          rows: controller.listOfColumns
                              .map(
                                ((element) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text(element[
                                            'Name']!)), //Extracting from Map element the value
                                        DataCell(TrafficButtonStatus(
                                          status: element['Number']!,
                                        )),
                                        DataCell(TrafficButtonStatus(
                                          status: element['Status'],
                                        )),
                                        DataCell(TrafficButtonStatus(
                                          status: element['Status'],
                                        )),
                                        const DataCell(TrafficButton(
                                          backgroundColor: Colors.green,
                                          value: 4,
                                          maxValue: 4,
                                          minValue: 0,
                                          division: 4,
                                        )),
                                        DataCell(TrafficButtonStatus(
                                          status: element['Status'],
                                        )),
                                        DataCell(TrafficButtonStatus(
                                          status: element['Status'],
                                        )),
                                        DataCell(TrafficButtonStatus(
                                          status: element['Status'],
                                        )),
                                        DataCell(TrafficButtonStatus(
                                          status: element['Status'],
                                        )),
                                        DataCell(TrafficButtonStatus(
                                          status: element['Status'],
                                        )),
                                      ],
                                    )),
                              )
                              .toList(),
                          border:
                              TableBorder.all(color: Colors.black, width: 1)),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
