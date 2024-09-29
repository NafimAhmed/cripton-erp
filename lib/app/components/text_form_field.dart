import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    Key? key,
    this.label,
    this.validationText,
    this.controller,
    this.suffixIconButton,
    this.prefixIcon,
    this.prefixIconColor,
    required this.obscureText,
    this.focusNode,
    this.fillColor,
  }) : super(key: key);

  final String? label;
  final String? validationText;
  final TextEditingController? controller;
  final IconButton? suffixIconButton;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final bool obscureText;
  final FocusNode? focusNode;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: fillColor != null,
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        suffixIcon: suffixIconButton,
        label: Text(label ?? ''),
        // contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        enabledBorder: ENABLED_BORDER,
        focusedBorder: FOCUSED_BORDER,
        errorBorder: ERROR_BORDER,
        focusedErrorBorder: FOCUSED_ERROR_BORDER,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validationText;
        } else {
          return null;
        }
      },
    );
  }
}

class PrimaryTextFormField extends StatelessWidget {
  const PrimaryTextFormField({
    Key? key,
    this.label,
    this.validationText,
    this.controller,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIcon,
    this.prefixIconColor,
    this.focusNode,
  }) : super(key: key);

  final String? label;
  final String? validationText;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: suffixIconColor,
        ),
        label: Text(label ?? ''),
        // contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        enabledBorder: ENABLED_BORDER,
        focusedBorder: FOCUSED_BORDER,
        errorBorder: ERROR_BORDER,
        focusedErrorBorder: FOCUSED_ERROR_BORDER,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validationText;
        } else {
          return null;
        }
      },
    );
  }
}

class SecondaryTextFormField extends StatelessWidget {
  const SecondaryTextFormField({
    Key? key,
    this.label,
    this.validationText,
    this.controller,
    this.suffixIcon,
    this.suffixIconColor,
    this.maxLines,
    this.hint,
    this.focusNode,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);
  final String? label;
  final String? hint;
  final String? validationText;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final int? maxLines;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      maxLines: maxLines,
      magnifierConfiguration: const TextMagnifierConfiguration(),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        suffixIcon: Icon(
          suffixIcon,
          color: suffixIconColor,
        ),
        label: Text(label ?? ''),
        // contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        enabledBorder: ENABLED_BORDER,
        focusedBorder: FOCUSED_BORDER,
        errorBorder: ERROR_BORDER,
        focusedErrorBorder: FOCUSED_ERROR_BORDER,
      ),
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return validationText;
            } else {
              return null;
            }
          },
    );
  }
}

////////////////////////////////////////////////////////////////////////////

class ClickableTextFormField extends StatelessWidget {
  const ClickableTextFormField(
      {Key? key,
      this.label,
      this.validationText,
      this.controller,
      this.suffixIcon,
      this.suffixIconColor,
      this.maxLines,
      this.hints,
      this.onIconTap,
      this.inputFormatters})
      : super(key: key);
  final String? label;
  final String? validationText;
  final String? hints;
  final VoidCallback? onIconTap;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onTap: onIconTap,
      canRequestFocus: false,
      inputFormatters: inputFormatters,
      magnifierConfiguration: const TextMagnifierConfiguration(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hints,
        suffixIcon: InkWell(
          onTap: onIconTap,
          child: Icon(
            suffixIcon,
            color: suffixIconColor,
          ),
        ),
        label: Text(label ?? ''),
        // contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        enabledBorder: ENABLED_BORDER,
        focusedBorder: FOCUSED_BORDER,
        errorBorder: ERROR_BORDER,
        focusedErrorBorder: FOCUSED_ERROR_BORDER,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validationText;
        } else {
          return null;
        }
      },
    );
  }
}
