import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/donut_chart.dart';
import '../../../../../components/text_form_field.dart';
import '../../../../../components/title_dropdown.dart';
import '../../../../../config/app_assets.dart';
import '../../../../../utils/color.dart';
import '../../../../../utils/daily_activity_component.dart';
import '../../../../../utils/screen_size.dart';
import '../controller/tna_controller.dart';

class TNAView extends GetView<TNAHomeController> {
  const TNAView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Image(
              height: 24,
              image: AssetImage(
                AppAssets.PSL_TRANSPARENT_WHITE_LOGO,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.user.empName ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    controller.user.designation ?? '',
                    style: const TextStyle(fontSize: 12),
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
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      children: [
                        TitleDropDown(
                            list: controller.companyList,
                            title: 'Company',
                            hints: 'Select Company',
                            dropdownWidth: screenWidth * 0.216,
                            dropdownHeight: 40),
                        const SizedBox(width: 10),
                        TitleDropDown(
                            list: controller.buyerList,
                            title: 'Buyer',
                            hints: 'Select Buyer',
                            dropdownWidth: screenWidth * 0.216,
                            dropdownHeight: 40),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleDropDown(
                            list: controller.jobNoList,
                            title: 'Job No.',
                            hints: 'Select Job no.',
                            dropdownWidth: screenWidth * 0.216,
                            dropdownHeight: 40),
                        const SizedBox(width: 10),
                        TitleDropDown(
                            list: controller.styleRefList,
                            title: 'Style ref.',
                            hints: 'Select Style ref.',
                            dropdownWidth: screenWidth * 0.216,
                            dropdownHeight: 40),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClickableTextFormField(
                            suffixIcon: Icons.date_range,
                            label: 'Start Date',
                            hints: 'DD-MM-YYYY',
                            onIconTap: () {},
                            controller: controller.startDateCont,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ClickableTextFormField(
                            suffixIcon: Icons.date_range,
                            label: 'End Date',
                            hints: 'DD-MM-YYYY',
                            onIconTap: () {},
                            controller: controller.endDateCont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                      child: DonutChart(
                          ChartModel: controller.tNAChartModel,
                          height: 150,
                          width: 150,
                          innerRedious: 30,
                          outerRedious: 60)),
                  Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            DailyActivityComponent(
                                width: 70,
                                height: 70,
                                title: 'Fabric Booking Delay',
                                value: '50',
                                itemColor: COLOR_PEST,
                                titleTextSize: 6.5),
                            DailyActivityComponent(
                                width: 70,
                                height: 70,
                                title: 'Trims Booking Delay',
                                value: '100',
                                itemColor: COLOR_BROWN,
                                titleTextSize: 6.5),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            DailyActivityComponent(
                              width: 70,
                              height: 70,
                              title: 'Yarn Booking Delay',
                              value: '300',
                              itemColor: PRIMARY_COLOR,
                              titleTextSize: 6.5,
                            ),
                            DailyActivityComponent(
                              width: 70,
                              height: 70,
                              title: 'Material in House',
                              value: '250',
                              itemColor: COLOR_PURPLE,
                              titleTextSize: 6.5,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: controller.tNAList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      controller
                          .onClickTNAMenue(controller.tNAList[index].route);
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
                        Text(controller.tNAList[index].titile),
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
