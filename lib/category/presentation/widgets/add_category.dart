import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:app/category/application/category_notifier.dart';
import 'package:app/category/application/providers/category_notifier_provider.dart';

class AddCategory extends ConsumerWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(categoryNotifierProvider.notifier);

    return IconButton(
      onPressed: () {
        _showAddCategoryDialog(context, notifier);
      },
      icon: const Icon(Icons.add),
      tooltip: 'إضافة فئة جديدة',
    );
  }

  void _showAddCategoryDialog(BuildContext context, CategoryNotifier notifier) {
    final form = FormGroup({
      'name': FormControl<String>(validators: [Validators.required]),
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
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
      ),
    );
  }
}
