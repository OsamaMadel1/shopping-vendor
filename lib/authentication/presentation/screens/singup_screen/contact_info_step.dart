import 'package:app/core/presentation/widgets/reactive_password_input_widget.dart';
import 'package:app/core/presentation/widgets/reactive_phone_widget.dart';
import 'package:app/core/presentation/widgets/reactive_text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ContactInfoStep extends StatelessWidget {
  const ContactInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReactiveTextInputWidget(
          hint: "Email",
          controllerName: "email",
          prefixIcon: Icons.email_outlined,
        ),
        const Gap(20),
        ReactivePasswordInputWidget(
          hint: "Password",
          controllerName: "password",
          showEye: true,
        ),
        const Gap(20),
        ReactivePasswordInputWidget(
          hint: "Confirm Password",
          controllerName: "confirmPassword",
          showEye: true,
        ),
        const Gap(20),
        const ReactivePhoneWidget(
          controllerName: "phone",
          suffixIcon: Icons.phone,
        ),
      ],
    );
  }
}
