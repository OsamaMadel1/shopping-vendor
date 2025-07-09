// import 'dart:io';
// import 'package:app/authentication/application/providers/auth_notifier_provider.dart';
// import 'package:app/category/presentation/widgets/category_dropdown_with_add.dart';
// import 'package:app/core/presentation/widgets/reactive_text_input_widget.dart';
// import 'package:app/mangment_products/application/product_state.dart';
// import 'package:app/mangment_products/application/providers/add_product_form_provider.dart';
// import 'package:app/mangment_products/application/providers/product_notifier_provider.dart';
// import 'package:app/mangment_products/domain/entities/product_entity.dart';
// import 'package:app/permissions/permission_handler.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// class AddProductScreen extends ConsumerWidget {
//   const AddProductScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authNotifierProvider);
//     final shopeId = authState.shopeId;

//     print("shopeId in AddProductScreen: ${shopeId}");
//     final form = ref.watch(addProductFormProvider);

//     ref.listen<ProductState>(productNotifierProvider, (previous, next) {
//       if (next is ProductError) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(next.message)),
//         );
//       }
//       if (next is ProductLoaded) {
//         // يمكن إغلاق الشاشة عند النجاح
//         if (context.mounted) Navigator.pop(context);
//       }
//     });

//     return Scaffold(
//       appBar: AppBar(title: const Text("إضافة منتج جديد")),
//       body: ReactiveForm(
//         formGroup: form,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               // اسم المنتج
//               ReactiveTextInputWidget(
//                 hint: 'name product',
//                 controllerName: 'nameProduct',
//               ),
//               const Gap(10),
//               // السعر
//               ReactiveTextInputWidget(
//                 hint: 'price product',
//                 controllerName: 'priceProduct',
//               ),
//               const Gap(10),

//               // الوصف
//               ReactiveTextInputWidget(
//                 hint: 'description product',
//                 controllerName: 'descriptionProduct',
//               ),
//               const Gap(10),
//               ReactiveTextInputWidget(
//                 hint: 'imageUrl',
//                 controllerName: "imageUrl",
//               ),
//               //TODO اختيار الصورة
//               // ReactiveFormConsumer(
//               //   builder: (context, form, _) {
//               //     final imageControl =
//               //         form.control('imageUrl') as FormControl<XFile?>;
//               //     final image = imageControl.value;

//               //     return Column(
//               //       children: [
//               //         if (image != null)
//               //           Image.file(
//               //             File(image.path),
//               //             height: 100,
//               //             width: 100,
//               //             fit: BoxFit.cover,
//               //           ),
//               //         const Gap(10),
//               //         ElevatedButton.icon(
//               //           icon: const Icon(Icons.image),
//               //           label: Text(
//               //               image == null ? 'اختيار صورة' : 'تغيير الصورة'),
//               //           onPressed: () async {
//               //             // طلب صلاحيات الكاميرا والتخزين
//               //             bool granted = await PermissionsRequester
//               //                 .requestCameraAndStoragePermissions();
//               //             if (!granted) {
//               //               ScaffoldMessenger.of(context).showSnackBar(
//               //                 const SnackBar(
//               //                   content: Text(
//               //                       'يرجى منح الصلاحيات للكاميرا والتخزين'),
//               //                 ),
//               //               );
//               //               return;
//               //             }
//               //             // متابعة اختيار الصورة
//               //             final picker = ImagePicker();
//               //             final picked = await picker.pickImage(
//               //                 source: ImageSource.gallery);
//               //             if (picked != null) {
//               //               imageControl.value = picked;
//               //             }
//               //           },
//               //         ),
//               //       ],
//               //     );
//               //   },
//               // ),

//               CategoryDropdownWithAdd(formControlName: "categoryId"),
//               const Gap(10),

//               ReactiveDropdownField<String>(
//                 formControlName: 'currency',
//                 decoration: const InputDecoration(
//                   labelText: 'اختر العملة',
//                   border: OutlineInputBorder(),
//                 ),
//                 items: const [
//                   DropdownMenuItem(value: '\$', child: Text('دولار \$')),
//                   DropdownMenuItem(value: 'SY', child: Text('ليرة سورية SY')),
//                   DropdownMenuItem(value: 'T', child: Text('تركي T')),
//                 ],
//               ),
//               const Gap(10),
//               Gap(20),

//               // زر الإضافة
//               ReactiveFormConsumer(
//                 builder: (context, form, child) {
//                   final state = ref.watch(productNotifierProvider);
//                   final isLoading = state is ProductLoading;
//                   return ElevatedButton(
//                     onPressed: form.valid && !isLoading
//                         ? () async {
//                             final name =
//                                 form.control('nameProduct').value as String;
//                             final price =
//                                 form.control('priceProduct').value as double;
//                             final desc = form
//                                 .control('descriptionProduct')
//                                 .value as String;
//                             final image = form.control('imageUrl').value
//                                 as /*XFile?*/ String;
//                             final categoryId =
//                                 form.control('categoryId').value as String;
//                             final currency =
//                                 form.control('currency').value as String;

//                             final shopeId = shopeId;
//                             if (shopeId == null) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text(
//                                         'خطأ: لم يتم العثور على معرف المتجر')),
//                               );
//                               return;
//                             }
//                             final product = ProductEntity(
//                               name: name,
//                               price: price,
//                               description: desc,
//                               image: image /* image?.path ?? ''*/,
//                               categoryId: categoryId,
//                               currency: currency,
//                               shopeId: shopeId,
//                             );

//                             await ref
//                                 .read(productNotifierProvider.notifier)
//                                 .addProduct(product);
//                           }
//                         : null,
//                     child: isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text('إضافة المنتج'),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //====== 2 =============//
// import 'dart:io';
// import 'package:app/authentication/application/providers/auth_notifier_provider.dart';
// import 'package:app/category/presentation/widgets/category_dropdown_with_add.dart';
// import 'package:app/core/presentation/widgets/reactive_text_input_widget.dart';
// import 'package:app/mangment_products/application/product_state.dart';
// import 'package:app/mangment_products/application/providers/add_product_form_provider.dart';
// import 'package:app/mangment_products/application/providers/product_notifier_provider.dart';
// import 'package:app/mangment_products/domain/entities/product_entity.dart';
// import 'package:app/permissions/permission_handler.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// class AddProductScreen extends ConsumerWidget {
//   const AddProductScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authNotifierProvider);
//     final shopeId = authState.shopeId;
//     final form = ref.watch(addProductFormProvider);
//     final theme = Theme.of(context);
//     final isDarkMode = theme.brightness == Brightness.dark;

//     ref.listen<ProductState>(productNotifierProvider, (previous, next) {
//       if (next is ProductError) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(next.message),
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         );
//       }
//       if (next is ProductLoaded) {
//         Navigator.pop(context);
//       }
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("إضافة منتج جديد"),
//         centerTitle: true,
//         elevation: 0,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(16),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Card(
//               elevation: 2,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: ReactiveForm(
//                   formGroup: form,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Text(
//                         "معلومات المنتج الأساسية",
//                         style: theme.textTheme.titleMedium?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: theme.colorScheme.primary,
//                         ),
//                       ),
//                       const Divider(height: 30),

//                       // اسم المنتج
//                       _buildLabel("اسم المنتج"),
//                       const Gap(8),
//                       ReactiveTextInputWidget(
//                         hint: 'أدخل اسم المنتج',
//                         controllerName: 'nameProduct',
//                         prefixIcon: Icons.shopping_bag_outlined,
//                       ),
//                       const Gap(16),

//                       //       السعر والعملة
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 _buildLabel("السعر"),
//                                 const Gap(8),
//                                 ReactiveTextInputWidget(
//                                   hint: '0.00',
//                                   controllerName: 'priceProduct',
//                                   // keyboardType: TextInputType.number,
//                                   prefixIcon: Icons.attach_money,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const Gap(16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 _buildLabel("العملة"),
//                                 const Gap(8),
//                                 ReactiveDropdownField<String>(
//                                   formControlName: 'currency',
//                                   decoration: InputDecoration(
//                                     prefixIcon:
//                                         const Icon(Icons.currency_exchange),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide: BorderSide(
//                                         color: isDarkMode
//                                             ? Colors.grey.shade700
//                                             : Colors.grey.shade300,
//                                       ),
//                                     ),
//                                     filled: true,
//                                     fillColor: isDarkMode
//                                         ? Colors.grey.shade800
//                                         : Colors.grey.shade100,
//                                   ),
//                                   items: const [
//                                     DropdownMenuItem(
//                                       value: '\$',
//                                       child: Text('دولار \$'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'SY',
//                                       child: Text('ليرة سورية SY'),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: 'T',
//                                       child: Text('ليرة تركية T'),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Gap(16),

//                       // الفئة
//                       _buildLabel("الفئة"),
//                       const Gap(8),
//                       CategoryDropdownWithAdd(
//                         formControlName: "categoryId",
//                         // decoration: InputDecoration(
//                         //   prefixIcon: const Icon(Icons.category_outlined),
//                         //   border: OutlineInputBorder(
//                         //     borderRadius: BorderRadius.circular(8),
//                         //   ),
//                         // ),
//                       ),
//                       const Gap(16),

//                       // الوصف
//                       _buildLabel("وصف المنتج"),
//                       const Gap(8),
//                       ReactiveTextInputWidget(
//                         hint: 'أدخل وصفاً للمنتج',
//                         controllerName: 'descriptionProduct',
//                         //  maxLines: 3,
//                         prefixIcon: Icons.description_outlined,
//                       ),
//                       const Gap(16),

//                       // صورة المنتج
//                       _buildLabel("صورة المنتج"),
//                       const Gap(8),
//                       ReactiveTextInputWidget(
//                         hint: 'رابط الصورة',
//                         controllerName: "imageUrl",
//                         prefixIcon: Icons.image_outlined,
//                       ),
//                       const Gap(8),
//                       Text(
//                         "أو",
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodySmall,
//                       ),
//                       const Gap(8),
//                       OutlinedButton.icon(
//                         icon: const Icon(Icons.upload_file),
//                         label: const Text("رفع صورة من الجهاز"),
//                         style: OutlinedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 14),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         onPressed: () async {
//                           bool granted = await PermissionsRequester
//                               .requestCameraAndStoragePermissions();
//                           if (!granted) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('يجب منح صلاحيات الوصول'),
//                                 behavior: SnackBarBehavior.floating,
//                               ),
//                             );
//                             return;
//                           }
//                           final picker = ImagePicker();
//                           final picked = await picker.pickImage(
//                               source: ImageSource.gallery);
//                           if (picked != null) {
//                             form.control('imageUrl').value = picked.path;
//                           }
//                         },
//                       ),
//                       const Gap(24),

//                       // زر الإضافة
//                       ReactiveFormConsumer(
//                         builder: (context, form, child) {
//                           final state = ref.watch(productNotifierProvider);
//                           final isLoading = state is ProductLoading;
//                           return ElevatedButton(
//                             onPressed: form.valid && !isLoading
//                                 ? () async {
//                                     final name = form
//                                         .control('nameProduct')
//                                         .value as String;
//                                     final price = form
//                                         .control('priceProduct')
//                                         .value as double;
//                                     final desc = form
//                                         .control('descriptionProduct')
//                                         .value as String;
//                                     final image = form.control('imageUrl').value
//                                         as String;
//                                     final categoryId = form
//                                         .control('categoryId')
//                                         .value as String;
//                                     final currency = form
//                                         .control('currency')
//                                         .value as String;

//                                     if (shopeId == null) {
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(
//                                         const SnackBar(
//                                           content: Text(
//                                               'خطأ: لم يتم العثور على المتجر'),
//                                           behavior: SnackBarBehavior.floating,
//                                         ),
//                                       );
//                                       return;
//                                     }

//                                     final product = ProductEntity(
//                                       name: name,
//                                       price: price,
//                                       description: desc,
//                                       image: image,
//                                       categoryId: categoryId,
//                                       currency: currency,
//                                       shopeId: shopeId,
//                                     );

//                                     await ref
//                                         .read(productNotifierProvider.notifier)
//                                         .addProduct(product);
//                                   }
//                                 : null,
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             child: isLoading
//                                 ? const SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2,
//                                       color: Colors.white,
//                                     ),
//                                   )
//                                 : const Text(
//                                     'إضافة المنتج',
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLabel(String text) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontWeight: FontWeight.w500,
//         fontSize: 14,
//       ),
//     );
//   }
// }

import 'package:app/authentication/application/providers/auth_notifier_provider.dart';
import 'package:app/category/presentation/widgets/add_category.dart';
import 'package:app/category/presentation/widgets/category_dropdown.dart';
import 'package:app/core/presentation/widgets/reactive_text_input_widget.dart';
import 'package:app/mangment_products/application/product_state.dart';
import 'package:app/mangment_products/application/providers/add_product_form_provider.dart';
import 'package:app/mangment_products/application/providers/product_notifier_provider.dart';
import 'package:app/mangment_products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddProductScreen extends ConsumerWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final shopeId = authState.shopeId;
    final form = ref.watch(addProductFormProvider);
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    ref.listen<ProductState>(productNotifierProvider, (previous, next) {
      if (next is ProductError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
      if (next is ProductLoaded) {
        Navigator.pop(context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("إضافة منتج جديد"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ReactiveForm(
                  formGroup: form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "معلومات المنتج الأساسية",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const Divider(height: 24),

                      // اسم المنتج
                      _buildLabel("اسم المنتج"),
                      const Gap(8),
                      ReactiveTextInputWidget(
                        hint: 'أدخل اسم المنتج',
                        controllerName: 'nameProduct',
                        prefixIcon: Icons.shopping_bag_outlined,
                      ),
                      const Gap(16),

                      // السعر والعملة
                      _buildPriceCurrencyRow(isSmallScreen, isDarkMode),
                      const Gap(16),

                      // الفئة
                      _buildLabel("الفئة"),
                      const Gap(8),
                      Row(
                        children: const [
                          Expanded(
                            child: CategoryDropdown(
                              formControlName: "categoryId",
                              labelText: "اختر الفئة",
                            ),
                          ),
                          SizedBox(width: 8),
                          AddCategory(),
                        ],
                      ),

                      const Gap(16),

                      // الوصف
                      _buildLabel("وصف المنتج"),
                      const Gap(8),
                      ReactiveTextInputWidget(
                        hint: 'أدخل وصفاً للمنتج',
                        controllerName: 'descriptionProduct',
                        prefixIcon: Icons.description_outlined,
                      ),
                      const Gap(16),

                      // صورة المنتج (رابط فقط)
                      _buildLabel("رابط صورة المنتج"),
                      const Gap(8),
                      ReactiveTextInputWidget(
                        hint: 'أدخل رابط الصورة',
                        controllerName: "image",
                        prefixIcon: Icons.link,
                      ),
                      const Gap(24),

                      // زر الإضافة
                      _buildSubmitButton(ref, form, theme),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceCurrencyRow(bool isSmallScreen, bool isDarkMode) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isSmallScreen ? 3 : 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("السعر"),
              const Gap(8),
              ReactiveTextInputWidget(
                hint: '0.00',
                controllerName: 'priceProduct',
              ),
            ],
          ),
        ),
        const Gap(10),
        Expanded(
          flex: isSmallScreen ? 2 : 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("العملة"),
              const Gap(8),
              Directionality(
                textDirection: TextDirection.ltr,
                child: ReactiveDropdownField<String>(
                  formControlName: 'currency',
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.currency_exchange, size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    isDense: true,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: '\$',
                      child: Text(
                        'دولار \$',
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'SY',
                      child: Text(
                        'ليرة سورية SY',
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'T',
                      child: Text(
                        'ليرة تركية T',
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(WidgetRef ref, FormGroup form, ThemeData theme) {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        final state = ref.watch(productNotifierProvider);
        final isLoading = state is ProductLoading;
        return ElevatedButton(
          onPressed: form.valid && !isLoading
              ? () async {
                  final name = form.control('nameProduct').value as String;
                  final price = form.control('priceProduct').value as double;
                  final desc =
                      form.control('descriptionProduct').value as String;
                  final image = form.control('image').value as String;
                  final categoryId = form.control('categoryId').value as String;
                  final currency = form.control('currency').value as String;
                  final shopeId = ref.read(authNotifierProvider).shopeId;

                  if (shopeId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('خطأ: لم يتم العثور على المتجر'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    return;
                  }

                  final product = ProductEntity(
                    name: name,
                    price: price,
                    description: desc,
                    image: image,
                    categoryId: categoryId,
                    currency: currency,
                    shopeId: shopeId,
                  );

                  await ref.read(productNotifierProvider.notifier).addProduct(
                        product,
                      );
                }
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'إضافة المنتج',
                  style: TextStyle(fontSize: 16),
                ),
        );
      },
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
