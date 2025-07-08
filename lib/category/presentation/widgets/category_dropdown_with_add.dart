import 'package:app/category/application/category_notifier.dart';
import 'package:app/category/application/providers/category_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CategoryDropdownWithAdd extends ConsumerWidget {
  final String formControlName;

  const CategoryDropdownWithAdd({
    super.key,
    required this.formControlName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryNotifierProvider);
    final notifier = ref.read(categoryNotifierProvider.notifier);
    // تحميل الفئات إذا كانت القائمة فارغة
    if (state.categories.isEmpty && !state.isLoading) {
      Future.microtask(() => notifier.fetchCategories());
    }
    return Row(
      children: [
        // Dropdown للفئات
        Expanded(
          child: ReactiveDropdownField<String>(
            formControlName: formControlName,
            decoration: InputDecoration(
              labelText: 'اختر الفئة',
              prefixIcon: const Icon(Icons.category_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            items: state.isLoading
                ? [
                    const DropdownMenuItem(
                        value: null, child: Text('... جارٍ التحميل'))
                  ]
                : state.categories
                    .map((category) => DropdownMenuItem(
                          value: category.id,
                          child: Text(category.name),
                        ))
                    .toList(),
          ),
        ),

        const SizedBox(width: 8),

        // زر الإضافة
        IconButton(
          onPressed: () {
            _showAddCategoryDialog(context, notifier);
          },
          icon: const Icon(Icons.add),
          tooltip: 'إضافة فئة جديدة',
        ),
      ],
    );
  }

  void _showAddCategoryDialog(
    BuildContext context,
    CategoryNotifier notifier,
  ) {
    final form = FormGroup({
      'name': FormControl<String>(validators: [Validators.required]),
    });

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('إضافة فئة جديدة'),
          content: ReactiveForm(
            formGroup: form,
            child: ReactiveTextField<String>(
              formControlName: 'name',
              decoration: const InputDecoration(
                labelText: 'اسم الفئة',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (form.valid) {
                  final name = form.control('name').value as String;
                  await notifier.addCategory(name);

                  Navigator.pop(context);
                }
              },
              child: const Text('إضافة'),
            ),
          ],
        );
      },
    );
  }
}
