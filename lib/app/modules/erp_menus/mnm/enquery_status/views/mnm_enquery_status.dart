import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/text_form_field.dart';
import '../../../../../components/title_dropdown.dart';
import '../../../../../utils/screen_size.dart';
import '../controller/mnm_enquery_status_controller.dart';

class MNMEnqueryStatusViews extends GetView<MNMEnqueryStatusController> {
  const MNMEnqueryStatusViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inquiry Status'),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleDropDown(
                          list: const [
                            'Tak & Tak',
                            'Fokir & Fokir',
                            'uefgkeqw',
                            'kjehf'
                          ],
                          title: 'Inquiry Status',
                          hints: 'Select Status',
                          dropdownHeight: 40,
                          dropdownWidth: screenWidth * 0.202,
                        ),
                        TitleDropDown(
                          list: const [
                            'Tak & Tak',
                            'Fokir & Fokir',
                            'uefgkeqw',
                            'kjehf'
                          ],
                          title: 'Buyer',
                          hints: 'Select Buyer',
                          dropdownHeight: 40,
                          dropdownWidth: screenWidth * 0.202,
                        ),
                      ],
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
                              // controller.onClickFromDateTextFormField(context);
                            },
                            // label: 'Date',
                            hints: 'From',
                            suffixIcon: Icons.calendar_month,
                            suffixIconColor: Colors.indigo,
                            //controller: controller.fromdateController,
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
                              //controller.onClickToDateTextFormField(context);
                            },
                            //label: 'Date',
                            hints: 'To',
                            suffixIcon: Icons.calendar_month,
                            suffixIconColor: Colors.indigo,
                            //controller: controller.todateController,
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'H&M',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Approved By SK. Nasif Wahid',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Date: 8 November 2023',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Inquiry No.',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const Text(
                            '#PKCL-23-00515',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  weight: 6,
                                ),
                                Text(
                                  'Preview',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
