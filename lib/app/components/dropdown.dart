import 'package:flutter/material.dart';

import '../utils/color.dart';

const OutlineInputBorder ENABLED_BORDER = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: ENABLED_BORDER_COLOR),
);
const OutlineInputBorder FOCUSED_BORDER = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: FOCUSED_BORDER_COLOR),
);
const OutlineInputBorder ERROR_BORDER = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: ERROR_BORDER_COLOR),
);
const OutlineInputBorder FOCUSED_ERROR_BORDER = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: FOCUSED_ERROR_BORDER_COLOR),
);

class PrimaryDropDownField extends StatelessWidget {
  const PrimaryDropDownField({
    Key? key,
    required this.list,
    this.validationText,
    this.hint,
    required this.onChanged,
    this.value,
  }) : super(key: key);

  final List<dynamic> list;
  final String? hint;
  final String? validationText;
  final void Function(String? value) onChanged;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: Text(hint ?? ''),
      value: (value == '') ? null : value,
      items: list
          .map((e) => DropdownMenuItem<String>(value: e, child: Text('$e')))
          .toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        enabledBorder: ENABLED_BORDER,
        focusedBorder: FOCUSED_BORDER,
        errorBorder: ERROR_BORDER,
        focusedErrorBorder: FOCUSED_ERROR_BORDER,
      ),
      validator: (value) {
        if ((value ?? '').isEmpty) {
          return validationText;
        } else {
          return null;
        }
      },
    );
  }
}

class SecondaryDropDownField extends StatelessWidget {
  const SecondaryDropDownField(
      {Key? key,
      required this.list,
      required this.selectedItem,
      this.validationText,
      this.hint,
      required this.onChanged})
      : super(key: key);

  final List<Object> list;
  final Object? selectedItem;
  final String? hint;
  final String? validationText;
  final void Function(Object? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Object>(
      value: selectedItem,
      hint: Text(
        hint ?? '',
        style: const TextStyle(fontSize: 16),
      ),
      items: list
          .map((e) => DropdownMenuItem<Object>(value: e, child: Text('$e')))
          .toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        enabledBorder: ENABLED_BORDER,
        focusedBorder: FOCUSED_BORDER,
        errorBorder: ERROR_BORDER,
        focusedErrorBorder: FOCUSED_ERROR_BORDER,
      ),
      validator: (value) {
        if (value == null) {
          return validationText;
        } else {
          return null;
        }
      },
    );
  }
}
