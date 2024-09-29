import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:google_fonts/google_fonts.dart';

import '../../../../../components/text_form_field.dart';
import '../../../../../components/title_dropdown.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/screen_size.dart';
import '../controllers/mnm_inquery_controllers.dart';

class MNMInqueryViews extends GetView<MNMInqueryController> {
  const MNMInqueryViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inquiry Summary'),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TitleDropDown(
                      list: const [
                        'Tak & Tak',
                        'Fokir & Fokir',
                        'uefgkeqw',
                        'kjehf'
                      ],
                      title: 'Company',
                      hints: 'Select Company',
                      dropdownHeight: 40,
                      dropdownWidth: screenWidth * 0.8,
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Row(
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.19,
                          child: ClickableTextFormField(
                            onIconTap: () async {
                              controller.onClickFromDateTextFormField(context);
                            },
                            // label: 'Date',
                            hints: 'From',
                            suffixIcon: Icons.calendar_month,
                            suffixIconColor: Colors.indigo,
                            controller: controller.fromdateController,
                            validationText: 'This field is required',
                          ),
                        ),
                        const Text(
                          'To',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                          width: screenWidth * 0.19,
                          child: ClickableTextFormField(
                            onIconTap: () async {
                              controller.onClickToDateTextFormField(context);
                            },
                            //label: 'Date',
                            hints: 'To',
                            suffixIcon: Icons.calendar_month,
                            suffixIconColor: Colors.indigo,
                            controller: controller.todateController,
                            validationText: 'This field is required',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Row(
                  //   children: [
                  //     ClickableTextFormField(
                  //       onIconTap: () async {
                  //         //controller.onClickDateTextFormField(context);
                  //       },
                  //       label: 'Date',
                  //       suffixIcon: Icons.calendar_month,
                  //       suffixIconColor: Colors.indigo,
                  //       //controller: controller.attendanceDateController,
                  //       validationText: 'This field is required',
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (contex, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: ListTile(
                      onTap: () {
                        controller.onClickMNMMenue(Routes.MNM_ENQUERY_STATUS);
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'H&M',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Order Count - 120',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Total Booking Count - 112',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Approved: 60',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Reject: 30',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Pending: 5',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Review: 5',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Row(
                                  children: [
                                    Icon(Icons.search),
                                    Text('Detail'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
