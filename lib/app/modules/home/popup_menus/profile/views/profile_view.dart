import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/image.dart';
import '../../../../../utils/color.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dataGap = 10;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(''),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //=============================Showing Basic Information=============================//
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: PRIMARY_COLOR,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  RoundedNetworkImage(
                    radius: 64,
                    border: 2,
                    imageUrl: '${controller.user.photoUrl}',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${controller.user.empName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${controller.user.designation}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${controller.user.deptName}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //=============================Showing Details Information=============================//
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ProfileDataRow(titile: 'User ID', data: controller.user.id),
                    SizedBox(height: dataGap),
                    ProfileDataRow(
                        titile: 'Department', data: controller.user.deptName),
                    SizedBox(height: dataGap),
                    ProfileDataRow(
                        titile: 'Email', data: controller.user.email),
                    SizedBox(height: dataGap),
                    ProfileDataRow(
                        titile: 'P. Phone', data: controller.user.mobile),
                    SizedBox(height: dataGap),
                    ProfileDataRow(
                        titile: 'O. Phone', data: controller.user.phone),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget ProfileDataRow({required String titile, String? data}) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                titile,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )),
          const Text(':'),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 2,
              child: Text(
                data ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 14),
              ))
        ],
      ),
    );
  }
}
