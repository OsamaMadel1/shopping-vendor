import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ignore: must_be_immutable
class ReactivePasswordInputWidget extends ConsumerWidget {
  ReactivePasswordInputWidget({
    super.key,
    required this.hint,
    this.validationMessages,
    required this.controllerName,
    this.showEye,
    this.textInputAction,
  });
  final String hint;
  Map<String, String Function(Object)>? validationMessages;
  final String controllerName;
  final bool? showEye;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context, ref) {
    var showText = ref.watch(showTextProvider);
    return ReactiveTextField(
      textInputAction: textInputAction ?? TextInputAction.done,
      obscureText: !showText,
      formControlName: controllerName,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.teal[300]),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.teal[300],
        ),
        labelText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: showEye == true
            ? IconButton(
                onPressed: () {
                  ref.read(showTextProvider.notifier).state = !showText;
                },
                icon: showText == true
                    ? Icon(Icons.remove_red_eye)
                    : Icon(Icons.visibility_off),
              )
            : null,
      ),
      validationMessages: validationMessages ??
          {
            "required": (error) => "Required",
            "email": (error) => "Email is not valid",
            "minLength": (error) => "Too short",
            'passwordMismatch': (error) => 'Passwords do not match'
          },
    );
  }
}

final showTextProvider = StateProvider<bool>((ref) => false);
