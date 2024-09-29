import 'package:get/get.dart';

class TNATrafficLightController extends GetxController {
  final List<String> leaveTypeList = ['Casual', 'Emergency', 'Medicel'];
  final List<String> BuyerList = ['sharmin', 'SARA', 'H&M'];
  List<Map<String, String>> listOfColumns = [
    {'Name': '12345', 'Number': 'done', 'State': 'assigned'},
    {'Name': '67890', 'Number': 'not done', 'State': 'delay done'},
    {'Name': '34567', 'Number': 'early done', 'State': 'not done'}
  ];
}
