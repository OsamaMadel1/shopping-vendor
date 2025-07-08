// mangment_product/application/providers/add_product_form_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

final addProductFormProvider = Provider<FormGroup>((ref) {
  return FormGroup({
    'nameProduct': FormControl<String>(
      validators: [Validators.required, Validators.minLength(2)],
    ),
    'priceProduct': FormControl<double>(
      validators: [
        Validators.required,
        // Validators.number(),
        Validators.min(0.1)
      ],
    ),
    'descriptionProduct': FormControl<String>(
      validators: [Validators.required, Validators.minLength(5)],
    ),
    // سنضيف حقل الصورة لاحقًا إذا أردت
    // 'imageUrl': FormControl<XFile?>(), // <-- حقل الصورة الجديد
    'image': FormControl<String>(),
    'categoryId': FormControl<String>(validators: [Validators.required]),
    'currency': FormControl<String>(validators: [Validators.required]),
  });
});
