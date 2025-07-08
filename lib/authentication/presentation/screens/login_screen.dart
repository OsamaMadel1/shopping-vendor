//application/presentation/screens/login_screen

import 'package:app/authentication/application/auth_state.dart';
import 'package:app/authentication/application/providers/auth_notifier_provider.dart';
import 'package:app/authentication/application/providers/log_in_form_provider.dart';
import 'package:app/authentication/domain/entities/user_login_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:gap/gap.dart';
import '../components/social_login_component.dart';
import '../../../core/presentation/widgets/button_widget.dart';
import '../../../core/presentation/widgets/reactive_password_input_widget.dart';
import '../../../core/presentation/widgets/reactive_text_input_widget.dart';
import '../../../core/presentation/widgets/text_button_widget.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final form = ref.watch(logInFormProvider);
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    // if (authState.status == AuthStatus.loading) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    ref.listen<AuthState>(authNotifierProvider, (prev, next) {
      if (next.status == AuthStatus.authenticated) {
        context.go('/mainScreen');
      } else if (next.status == AuthStatus.error && next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          Gap(50),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.95, // العرض بنسبة 90% من الشاشة
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //  الحاوية الحمراء في الخلف
                  Align(
                    alignment: Alignment.center,
                    child: FractionallySizedBox(
                      widthFactor: 0.6, // العرض 80% من الشاشة
                      child: Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                    ),
                  ),

                  //  الحاوية البيضاء في الأمام
                  Align(
                    alignment: Alignment.center,
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ReactiveForm(
                          formGroup: form,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                              const Gap(20),
                              ReactiveTextInputWidget(
                                hint: "Email",
                                controllerName: "email",
                                prefixIcon: Icons.email_outlined,
                              ),
                              const Gap(40),
                              ReactivePasswordInputWidget(
                                hint: "Password",
                                controllerName: "password",
                                showEye: true,
                                textInputAction: TextInputAction.done,
                              ),
                              const Gap(20),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: ReactiveValueListenableBuilder(
                                  formControlName: "email",
                                  builder: (context, control, child) {
                                    return TextButtonWidget(
                                      foregroundColor:
                                          Theme.of(context).colorScheme.scrim,
                                      text: "Forgot Password?",
                                      onTap: control.invalid
                                          ? null
                                          : () {
                                              //TODO: reset password
                                            },
                                    );
                                  },
                                ),
                              ),
                              const Gap(20),
                              ReactiveFormConsumer(
                                builder: (context, formGroup, child) {
                                  return Center(
                                    child: ButtonWidget(
                                      text: "Sign In",
                                      isLoading: authState.status ==
                                          AuthStatus.loading,
                                      onTap: formGroup.invalid
                                          ? null
                                          : () async {
                                              FocusScope.of(context)
                                                  .unfocus(); //  لإغلاق لوحة المفاتيح
                                              // final email = formGroup
                                              //     .control("email")
                                              //     .value.trim() as String;
                                              // final password = formGroup
                                              //     .control("password")
                                              //     .value.trim() as String;
                                              final email = (formGroup
                                                          .control("email")
                                                          .value as String?)
                                                      ?.trim() ??
                                                  '';
                                              final password = (formGroup
                                                          .control("password")
                                                          .value as String?)
                                                      ?.trim() ??
                                                  '';
                                              await authNotifier.login(
                                                UserLoginEntity(
                                                    email: email,
                                                    password: password),
                                              );
                                            },
                                    ),
                                  );
                                },
                              ),
                              const Gap(20),
                              Center(child: Text('Or using social media')),
                              const Gap(15),
                              SocialLoginComponent(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    context.push("/signUp");
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
