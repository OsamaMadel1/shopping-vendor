import 'package:app/category/application/providers/category_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CategoryDropdown extends ConsumerWidget {
  final String formControlName;
  final String? labelText;

  const CategoryDropdown({
    super.key,
    this.labelText,
    required this.formControlName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryNotifierProvider);
    final notifier = ref.read(categoryNotifierProvider.notifier);

    // تحميل الفئات إذا كانت فارغة
    if (state.categories.isEmpty && !state.isLoading) {
      Future.microtask(() => notifier.fetchCategories());
    }

    return ReactiveDropdownField<String>(
      formControlName: formControlName,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.category_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      items: state.isLoading
          ? [
              const DropdownMenuItem(
                value: null,
                child: Text('... جارٍ التحميل'),
              )
            ]
          : state.categories
              .map((category) => DropdownMenuItem(
                    value: category.id,
                    child: Text(category.name),
                  ))
              .toList(),
    );
  }
}
