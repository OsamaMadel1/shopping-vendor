import 'package:app/mangment_products/application/providers/get_product_by_id_provider.dart';
import 'package:app/mangment_products/application/providers/product_notifier_provider.dart';
import 'package:app/mangment_products/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final String id;

  const ProductDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(getProductByIdProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل المنتج'),
        centerTitle: true,
        elevation: 0,
      ),
      body: productAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            const Center(child: Text('حدث خطأ أثناء تحميل المنتج')),
        data: (product) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ✅ صورة المنتج
                Hero(
                  tag: 'product-${product.id}',
                  child: Container(
                    height: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        // product.image.isNotEmpty
                        //     ? product.image
                        //     :
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                        // loadingBuilder: (context, child, loadingProgress) {
                        //   if (loadingProgress == null) return child;
                        //   return Center(
                        //     child: CircularProgressIndicator(
                        //       value: loadingProgress.expectedTotalBytes != null
                        //           ? loadingProgress.cumulativeBytesLoaded /
                        //               loadingProgress.expectedTotalBytes!
                        //           : null,
                        //     ),
                        //   );
                        //},
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(Icons.broken_image,
                                size: 60, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(10),
                // ✅ الاسم والسعر
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      product.name,
                    ),
                    Text(
                      '${NumberFormat.currency(locale: 'ar', symbol: product.currency).format(product.price)}',
                    ),
                    // ✅ التصنيف
                    Text(
                      'الفئة: ${product.categoryName ?? "غير محددة"}',
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ✅ الوصف
                Center(
                  child: Text(
                    'الوصف',
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Text(
                    product.description.isNotEmpty
                        ? product.description
                        : 'لا يوجد وصف متاح',
                  ),
                ),

                const SizedBox(height: 32),

                // ✅ أزرار التعديل والحذف
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => _editProduct(context, product),
                        icon: const Icon(Icons.edit_outlined),
                        label: const Text('تعديل'),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.orange[700],
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () =>
                            _confirmDeleteProduct(context, ref, product.id!),
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('حذف'),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.red[700],
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ✅ الانتقال إلى شاشة التعديل
  void _editProduct(BuildContext context, ProductEntity product) {
    context.pushNamed('editProductScreen', extra: product);
  }

  // ✅ عرض نافذة تأكيد الحذف
  void _confirmDeleteProduct(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف المنتج'),
        content: const Text('هل أنت متأكد من حذف هذا المنتج؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              ref.read(productNotifierProvider.notifier).deleteProduct(id);
              Navigator.pop(context); // يغلق الحوار
              Navigator.pop(context); // يعود للوراء من الشاشة
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم حذف المنتج')),
              );
            },
            child: const Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
