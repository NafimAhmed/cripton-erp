import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final dbDateFormat = DateFormat('dd/MM/yyyy'); // DB Date formate
DateTime stringToDateTime(String dbFormatedDate) =>
    dbDateFormat.parse(dbFormatedDate);

String getFormatedDate(DateTime date) => DateFormat('dd-MMM-yyyy').format(date);
String getFormatedDateInDBFormate(DateTime date) =>
    DateFormat('dd/MM/yyyy').format(date);
String getFormatedTimeInDBFormate(DateTime time) =>
    DateFormat('HH:mm:ss').format(time);
String getFormatedTimeFromTimeOfDayInDBFormate(TimeOfDay time) =>
    DateFormat('HH:mm:ss').format(DateTime(2024, 1, 1, time.hour, time.minute));

TextInputFormatter DB_DATE_INPUT_FORMATE = FilteringTextInputFormatter.allow(
    RegExp(r'^(0[1-9]|[12]\d|3[01])\/(0[1-9]|1[0-2])\/(19|20)\d{2}$'));

Future<DateTime?> showDatePickerDialog({
  required BuildContext context,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate ?? DateTime(2015),
      lastDate: lastDate ?? DateTime(2025));

  return pickedDate;
}

Future<TimeOfDay?> showTimePickerDialog(BuildContext context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  return pickedTime;
}

Future<TimeOfDay?> showTimePickerDialogIn24HourFormate(
    BuildContext context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );
    },
  );
  return pickedTime;
}

int compareDateString({required String start, required String end}) {
  DateTime startDate = dbDateFormat.parse(start);
  DateTime endDate = dbDateFormat.parse(end);
  //   0 = start and end is same
  // < 0 = start is before end
  // > 0 = start is after end
  return startDate.compareTo(endDate);
}
