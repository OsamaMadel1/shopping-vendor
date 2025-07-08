//application/presentation/screens/signup_screen
import 'package:app/authentication/application/auth_state.dart';
import 'package:app/authentication/application/providers/auth_notifier_provider.dart';
import 'package:app/authentication/application/providers/signup_form_provider.dart';
import 'package:app/authentication/domain/entities/user_register_entity.dart';
import 'package:app/authentication/domain/value_objects/address_entity.dart';
import 'package:app/authentication/presentation/screens/singup_screen/address_info_step.dart';
import 'package:app/authentication/presentation/screens/singup_screen/contact_info_step.dart';
import 'package:app/authentication/presentation/screens/singup_screen/personal_info_step.dart';
import 'package:app/authentication/presentation/components/social_login_component.dart';
import 'package:app/core/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

// import 'package:app/authentication/domain/value_objects/gender_entity.dart';import 'package:app/core/presentation/widgets/reactiv_radio_list_tile_gender.dart';
// import 'package:app/core/presentation/widgets/reactive_checkbox_list_tile_apartment.dart';
// import 'package:app/core/presentation/widgets/reactive_date_picker_widget.dart';
// import 'package:app/core/presentation/widgets/reactive_password_input_widget.dart';
// import 'package:app/core/presentation/widgets/reactive_phone_widget.dart';
// import 'package:app/core/presentation/widgets/reactive_text_input_widget.dart';
// class SignupScreen extends ConsumerWidget {
//   const SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context, ref) {
//     final form = ref.watch(signUpFormProvider);
//     final authState = ref.watch(authNotifierProvider);
//     final authNotifier = ref.read(authNotifierProvider.notifier);

//     ref.listen<AuthState>(authNotifierProvider, (previous, next) {
//       if (next.status == AuthStatus.authenticated) {
//         context.go('/mainScreen'); // ✅ غيّر المسار لواجهة التطبيق الرئيسية
//       } else if (next.status == AuthStatus.error && next.error != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               next.error!,
//               style: const TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     });

//     return Scaffold(
//       backgroundColor: Colors.teal,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
//             child: Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     blurRadius: 15,
//                     offset: Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: ReactiveForm(
//                 formGroup: form,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         'Create Account',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.teal.shade700,
//                         ),
//                       ),
//                     ),
//                     const Gap(25),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ReactiveTextInputWidget(
//                             hint: "First Name",
//                             controllerName: "firstName",
//                             prefixIcon: Icons.person_outline,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: ReactiveTextInputWidget(
//                             hint: "Last Name",
//                             controllerName: "lastName",
//                             prefixIcon: Icons.person_outline,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Gap(20),
//                     ReactiveTextInputWidget(
//                       hint: "Email",
//                       controllerName: "email",
//                       prefixIcon: Icons.email_outlined,
//                     ),
//                     const Gap(20),
//                     ReactivePasswordInputWidget(
//                       hint: "Password",
//                       controllerName: "password",
//                       showEye: true,
//                       textInputAction: TextInputAction.next,
//                     ),
//                     const Gap(20),
//                     ReactivePasswordInputWidget(
//                       hint: "Confirm Password",
//                       controllerName: "confirmPassword",
//                       showEye: true,
//                       textInputAction: TextInputAction.done,
//                     ),
//                     const Gap(20),
//                     ReactivePhoneWidget(
//                       controllerName: "phone",
//                       suffixIcon: Icons.phone,
//                     ),
//                     const Gap(20),
//                     ReactiveDatePickerWidget(controlName: "dateOfBirth"),
//                     const Gap(20),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ReactiveTextInputWidget(
//                             hint: "City",
//                             controllerName: "city",
//                             prefixIcon: Icons.location_city,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: ReactiveTextInputWidget(
//                             hint: "Street",
//                             controllerName: "street",
//                             prefixIcon: Icons.location_on,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Gap(20),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ReactiveTextInputWidget(
//                             hint: "Floor",
//                             controllerName: "floor",
//                             prefixIcon: Icons.apartment,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: ReactiveTextInputWidget(
//                             hint: "Apartment",
//                             controllerName: "apartment",
//                             prefixIcon: Icons.apartment,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Gap(10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ReactiveCheckboxApartment(
//                           controlName: "hasApartment",
//                           label: 'Have Apartment?',
//                         ),
//                         const Gap(10),
//                         Text(
//                           'Gender',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.teal[700],
//                           ),
//                         ),
//                         const Gap(10),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: ReactivRadioListTileGender(
//                                 controlName: 'gender',
//                                 gender: GenderEntity.male,
//                                 label: 'Male',
//                               ),
//                             ),
//                             Gap(10),
//                             Expanded(
//                               child: ReactivRadioListTileGender(
//                                 controlName: 'gender',
//                                 gender: GenderEntity.female,
//                                 label: 'Female',
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const Gap(20),
//                     ReactiveFormConsumer(
//                       builder: (context, formGroup, child) {
//                         return Center(
//                           child: ButtonWidget(
//                             text: "Sign Up",
//                             isLoading: authState.status == AuthStatus.loading,
//                             onTap: formGroup.invalid
//                                 ? null
//                                 : () async {
//                                     FocusScope.of(context)
//                                         .unfocus(); //  لإغلاق لوحة المفاتيح
//                                     // final user = UserRegisterEntity(
//                                     //   firstName: form
//                                     //       .control("firstName")
//                                     //       .value
//                                     //       .trim(),
//                                     //   lastName:
//                                     //       form.control("lastName").value.trim(),
//                                     //   email: form.control("email").value.trim(),
//                                     //   password:
//                                     //       form.control("password").value.trim(),
//                                     //   phone: (form.control("phone").value.trim()
//                                     //           as PhoneNumber)
//                                     //       .international,
//                                     //   address: AddressEntity(
//                                     //     city: form.control("city").value.trim(),
//                                     //     street:
//                                     //         form.control("street").value.trim(),
//                                     //     floor:
//                                     //         form.control("floor").value.trim(),
//                                     //     apartment: form
//                                     //         .control("apartment")
//                                     //         .value
//                                     //         .trim(),
//                                     //     defaultAddress: form
//                                     //         .control("hasApartment")
//                                     //         .value
//                                     //         .trim(),
//                                     //   ),
//                                     //   // gender: form.control("gender").value,
//                                     //   // dateOfBirth:
//                                     //   //     form.control("dateOfBirth").value,
//                                     // );
//                                     final firstName = (form
//                                                 .control("firstName")
//                                                 .value as String?)
//                                             ?.trim() ??
//                                         '';
//                                     final lastName = (form
//                                                 .control("lastName")
//                                                 .value as String?)
//                                             ?.trim() ??
//                                         '';
//                                     final email =
//                                         (form.control("email").value as String?)
//                                                 ?.trim() ??
//                                             '';
//                                     final password = (form
//                                                 .control("password")
//                                                 .value as String?)
//                                             ?.trim() ??
//                                         '';
//                                     final phone = (form.control("phone").value
//                                             as PhoneNumber)
//                                         .international;
//                                     final city =
//                                         (form.control("city").value as String?)
//                                                 ?.trim() ??
//                                             '';
//                                     final street = (form.control("street").value
//                                                 as String?)
//                                             ?.trim() ??
//                                         '';
//                                     final floor =
//                                         (form.control("floor").value as String?)
//                                                 ?.trim() ??
//                                             '';
//                                     final apartment = (form
//                                                 .control("apartment")
//                                                 .value as String?)
//                                             ?.trim() ??
//                                         '';
//                                     final hasApartment = form
//                                         .control("hasApartment")
//                                         .value as bool;

//                                     final user = UserRegisterEntity(
//                                       firstName: firstName,
//                                       lastName: lastName,
//                                       email: email,
//                                       password: password,
//                                       phone: phone,
//                                       address: AddressEntity(
//                                         city: city,
//                                         street: street,
//                                         floor: floor,
//                                         apartment: apartment,
//                                         defaultAddress: hasApartment,
//                                       ),
//                                     );

//                                     await authNotifier.register(user);
//                                   },
//                           ),
//                         );
//                       },
//                     ),
//                     const Gap(20),
//                     Center(
//                       child: Column(
//                         children: [
//                           Text(
//                             "or sign in using",
//                             style: TextStyle(color: Colors.grey.shade600),
//                           ),
//                           const Gap(15),
//                           SocialLoginComponent(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

final stepProvider = StateProvider<int>((ref) => 0);

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(signUpFormProvider);
    final currentStep = ref.watch(stepProvider);
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next.status == AuthStatus.authenticated) {
        context.go('/mainScreen');
      } else if (next.status == AuthStatus.error && next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: Colors.red),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  const Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      final isActive = index == currentStep;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: isActive ? 16 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.teal : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }),
                  ),
                  const Gap(25),
                  IndexedStack(
                    index: currentStep,
                    children: const [
                      PersonalInfoStep(),
                      ContactInfoStep(),
                      AddressInfoStep(),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentStep > 0)
                        ButtonWidget(
                          onTap: () {
                            ref.read(stepProvider.notifier).state--;
                          },
                          text: "Back",
                        ),
                      const Spacer(),
                      ReactiveFormConsumer(
                        builder: (context, formGroup, child) {
                          final isLastStep = currentStep == 2;

                          return ButtonWidget(
                            text: isLastStep ? "Sign Up" : "Next",
                            isLoading: authState.status == AuthStatus.loading,
                            onTap: () async {
                              final currentStepIndex = ref.read(stepProvider);
                              bool isStepValid = false;

                              switch (currentStepIndex) {
                                case 0:
                                  isStepValid =
                                      form.control('firstName').valid &&
                                          form.control('lastName').valid &&
                                          form.control('dateOfBirth').valid &&
                                          form.control('gender').valid;
                                  break;
                                case 1:
                                  isStepValid = form.control('email').valid &&
                                      form.control('password').valid &&
                                      form.control('confirmPassword').valid &&
                                      form.control('phone').valid;
                                  break;
                                case 2:
                                  isStepValid = form.control('city').valid &&
                                      form.control('street').valid &&
                                      form.control('floor').valid &&
                                      form.control('apartment').valid &&
                                      form.control('hasApartment').valid;
                                  break;
                              }

                              if (!isStepValid) return;

                              if (!isLastStep) {
                                ref.read(stepProvider.notifier).state++;
                              } else {
                                FocusScope.of(context).unfocus();
                                final user = _mapFormToEntity(form);
                                await authNotifier.register(user);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const Gap(20),
                  Text("or sign in using",
                      style: TextStyle(color: Colors.grey.shade600)),
                  const Gap(15),
                  const SocialLoginComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static UserRegisterEntity _mapFormToEntity(FormGroup form) {
    final phone = form.control("phone").value as PhoneNumber;
    return UserRegisterEntity(
      firstName: form.control("firstName").value.trim(),
      lastName: form.control("lastName").value.trim(),
      email: form.control("email").value.trim(),
      password: form.control("password").value.trim(),
      phone: phone.international,
      address: AddressEntity(
        city: form.control("city").value.trim(),
        street: form.control("street").value.trim(),
        floor: form.control("floor").value.trim(),
        apartment: form.control("apartment").value.trim(),
        defaultAddress: form.control("hasApartment").value,
      ),
    );
  }
}
