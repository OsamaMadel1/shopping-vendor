import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

// enum InputStyle { underlined, outlined, filled }

// ignore: must_be_immutable
class ReactiveTextInputWidget extends StatelessWidget {
  ReactiveTextInputWidget({
    super.key,
    required this.hint,
    this.validationMessages,
    required this.controllerName,
    // this.inputStyle,
    this.textInputAction,
    this.prefixIcon,
  });
  final String hint;
  Map<String, String Function(Object)>? validationMessages;
  final String controllerName;
  // final InputStyle? inputStyle;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      textInputAction: textInputAction ?? TextInputAction.done,
      formControlName: controllerName,
      // keyboardType: TextInputType.number,
      //maxLines: 3,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.teal[300]),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.teal[300],
          ),
          // filled: inputStyle == InputStyle.filled,
          labelText: hint,
          border:
              // inputStyle == InputStyle.outlined?
              OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
          //  : inputStyle == InputStyle.filled
          //   ? OutlineInputBorder(
          //    borderSide: BorderSide.none,
          //    borderRadius: BorderRadius.circular(10),
          //    )
          //   : UnderlineInputBorder(),
          //  fillColor: inputStyle == InputStyle.filled
          //  ? Theme.of(context).colorScheme.outlineVariant
          //  : null,
          ),
      validationMessages: validationMessages ??
          {
            "required": (o) => "Required",
            "email": (o) => "Email is not valid",
            "minLength": (o) => "Too short",
          },
    );
  }
}
