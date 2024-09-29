import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/circle_shape.dart';
import '../../../components/donut_chart.dart';
import '../../../components/image.dart';
import '../../../components/popup_menu_item.dart';
import '../../../config/app_assets.dart';
import '../../../data/erp_menu_data.dart';
import '../../../models/menu.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/color.dart';
import '../controllers/home_controller.dart';
import '../models/approval_summary.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Image(
                height: 24,
                image: AssetImage(AppAssets.PSL_TRANSPARENT_WHITE_LOGO),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.user.organizationShortName ?? '',
                          style: const TextStyle(fontSize: 12),
                        ),
                        controller.user.regionShortName != null
                            ? Text(
                                ' (${controller.user.regionShortName})',
                                style: const TextStyle(fontSize: 12),
                              )
                            : const Text('')
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          actions: [
            Theme(
                data: Theme.of(context).copyWith(
                  cardColor: PRIMARY_COLOR,
                ),
                child: HomePopUpMenuButton()),
            const SizedBox(width: 10)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //========================================Status Card============================================\\

                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Obx(
                          () => Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                DonutChart(
                                  ChartModel: controller
                                      .attendenceSummaryModelList.value,
                                  height: 160,
                                  width: 160,
                                  innerRedious: 44,
                                  outerRedious: 80,
                                ),
                                const SizedBox(height: 10),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          CircleShape(color: PRESENT_COLOR),
                                          SizedBox(width: 5),
                                          Text('Present'),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleShape(color: ABSENT_COLOR),
                                          SizedBox(width: 5),
                                          Text('Absent')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          CircleShape(color: LEAVE_COLOR),
                                          SizedBox(width: 5),
                                          Text('Leave'),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CircleShape(color: HOLIDAY_COLOR),
                                          SizedBox(width: 5),
                                          Text('Holiday')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          height: 240,
                          padding: const EdgeInsets.all(20),
                          child: Obx(() => ListView.builder(
                                itemCount: controller
                                    .approvalSummaryModelList.value.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  ApprovalSummaryModel approvalSummaryModel =
                                      controller.approvalSummaryModelList
                                          .value[index];
                                  return InkWell(
                                    onTap: () {
                                      controller.onClicApprovalSummaryItem(
                                          approvalSummaryModel:
                                              approvalSummaryModel);
                                    },
                                    child: HomeMenuItem(
                                      itemCount:
                                          approvalSummaryModel.counts ?? 0,
                                      titile: approvalSummaryModel.title ?? '',
                                    ),
                                  );
                                },
                              )),
                        ),
                      ),
                    ),
                  ],
                ),

                //========================================ERP Menu============================================\\
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: erpMenus.length,
                      itemBuilder: (context, position) {
                        MenuModel menuModel = erpMenus[position];
                        return InkWell(
                            onTap: () {
                              controller.onClickERPMenue(menuModel);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  menuModel.icon,
                                  width: 48,
                                  height: 48,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  menuModel.titile,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                ),
                // //========================================Carosel Card============================================\\
                // Card(
                //   child: Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Column(
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             IconButton(
                //               onPressed: controller.onClickBackwardCarousel,
                //               icon: const Icon(Icons.arrow_back),
                //             ),
                //             const Text('Month-Wise Order Status'),
                //             IconButton(
                //               onPressed: controller.onClickForwardCarousel,
                //               icon: const Icon(Icons.arrow_forward),
                //             ),
                //           ],
                //         ),
                //         PrimarCarousel(
                //           carouselController: controller.carouselController,
                //           itemList: [
                //             Container(
                //               width: screenWidth,
                //               color: Colors.white,
                //               child: Center(
                //                   child: SfCartesianChart(
                //                       // Initialize category axis
                //                       primaryXAxis: CategoryAxis(),
                //                       series: <LineSeries<SalesData, String>>[
                //                     LineSeries<SalesData, String>(
                //                         // Bind data source
                //                         dataSource: <SalesData>[
                //                           SalesData('Jan', 35),
                //                           SalesData('Feb', 28),
                //                           SalesData('Mar', 34),
                //                           SalesData('Apr', 32),
                //                           SalesData('May', 40)
                //                         ],
                //                         xValueMapper: (SalesData sales, _) =>
                //                             sales.year,
                //                         yValueMapper: (SalesData sales, _) =>
                //                             sales.sales)
                //                   ])),
                //             ),
                //             Container(
                //               width: screenWidth,
                //               color: Colors.white,
                //               child: SfCartesianChart(
                //                 series: <BarSeries<SalesData, double>>[
                //                   BarSeries(
                //                       dataSource: <SalesData>[
                //                         SalesData('Jan', 35),
                //                         SalesData('Feb', 28),
                //                         SalesData('Mar', 34),
                //                         SalesData('Apr', 32),
                //                         SalesData('May', 40)
                //                       ],
                //                       xValueMapper: (SalesData sales, _) =>
                //                           sales.sales,
                //                       yValueMapper: (SalesData sales, _) =>
                //                           sales.sales)
                //                 ],
                //               ),
                //             ),
                //             SingleChildScrollView(
                //               scrollDirection: Axis.horizontal,
                //               child: Row(
                //                 children: [
                //                   DailyActivityComponent(
                //                     width: screenWidth * 0.15,
                //                     height: 100,
                //                     title: 'Booking Delay',
                //                     value: '50',
                //                     itemColor: COLOR_PEST,
                //                   ),
                //                   DailyActivityComponent(
                //                     width: screenWidth * 0.15,
                //                     height: 100,
                //                     title: 'PI Status',
                //                     value: '100',
                //                     itemColor: COLOR_BROWN,
                //                   ),
                //                   DailyActivityComponent(
                //                     width: screenWidth * 0.15,
                //                     height: 100,
                //                     title: 'Budget Approval',
                //                     value: '100',
                //                     itemColor: PRIMARY_COLOR,
                //                   ),
                //                   DailyActivityComponent(
                //                     width: screenWidth * 0.15,
                //                     height: 100,
                //                     title: 'LC Pending',
                //                     value: '100',
                //                     itemColor: COLOR_PURPLE,
                //                   ),
                //                 ],
                //               ),
                //             )
                //           ],
                //           height: 150,
                //         ),
                //       ],
                //     ),
                //   ),
                // )

                /////////////////////////////////////////////////////////////////////////////////////////////////////////
              ],
            ),
          ),
        ));
  }

  PopupMenuButton HomePopUpMenuButton() {
    List<PopupMenuEntry<dynamic>> popupMenuItems = [];
    popupMenuItems.add(
      PrimaryPopupMenuItem(
        onTap: () {
          Get.toNamed(Routes.PROFILE);
        },
        iconData: Icons.account_circle_outlined,
        titile: 'My Profile',
      ),
    );

    if (controller.user.userType == 'Sys Admin' ||
        controller.user.userType == 'Admin') {
      popupMenuItems.add(
        PrimaryPopupMenuItem(
          onTap: () {
            Get.offNamed(Routes.COMPANY);
          },
          iconData: Icons.apartment,
          titile: 'Change Company',
        ),
      );
    }

    popupMenuItems.addAll([
      PrimaryPopupMenuItem(
        onTap: controller.onClickNotification,
        iconData: Icons.notifications,
        badgeCount: controller.notificationCount,
        titile: 'Notifications',
      ),
      PrimaryPopupMenuItem(
        onTap: () {
          Get.toNamed(Routes.CHANGE_PASSWORD);
        },
        iconData: Icons.lock,
        iconColor: Colors.white,
        titile: 'Change Password',
      ),
      PrimaryPopupMenuItem(
        onTap: () {
          controller.onClickLogout();
        },
        iconData: Icons.logout_outlined,
        iconColor: Colors.red,
        titile: 'Logout',
      ),
    ]);
    return PopupMenuButton(
      color: PRIMARY_COLOR,
      child: RoundedNetworkImage(
        imageUrl: controller.user.photoUrl ?? '',
        radius: 20,
        border: 1,
      ),
      itemBuilder: (context) => popupMenuItems,
    );
  }

  Widget HomeMenuItem({required int itemCount, required String titile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '$titile ($itemCount)',
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16)
          ],
        ),
        const SizedBox(height: 4),
        const Divider(thickness: 2),
      ],
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
