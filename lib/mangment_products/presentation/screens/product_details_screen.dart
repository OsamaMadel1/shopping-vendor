// import 'package:flutter/material.dart';
// import 'package:app/mangment_products/domain/entities/product_entity.dart'; // أو المسار المناسب

// class ProductDetailsScreen extends StatelessWidget {
//   final ProductEntity product;

//   const ProductDetailsScreen({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('تفاصيل المنتج'),
//         backgroundColor: Colors.teal,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(bottom: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // ✅ صورة المنتج
//             Container(
//               height: 220,
//               margin: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     offset: Offset(0, 5),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image.network(
//                   'assets/images/logo.png',
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) =>
//                       const Icon(Icons.broken_image, size: 80),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             // ✅ الاسم والسعر
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     product.name,
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '${product.price} ${product.currency}',
//                     style: const TextStyle(fontSize: 18, color: Colors.teal),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 16),

//             // ✅ الوصف
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Center(
//                 child: Text(
//                   product.description ?? 'لا يوجد وصف متاح.',
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),

//             const Spacer(),

//             // ✅ أزرار
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         // تعديل
//                       },
//                       icon: const Icon(Icons.edit),
//                       label: const Text('تعديل'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         // حذف
//                       },
//                       icon: const Icon(Icons.delete),
//                       label: const Text('حذف'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:app/category/domain/entity/gategory_entity.dart';
import 'package:app/mangment_products/application/providers/product_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/mangment_products/domain/entities/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final ProductEntity product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        title: const Text('تفاصيل المنتج'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.colorScheme.onBackground,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // صورة المنتج
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

            const SizedBox(height: 24),

            // معلومات المنتج
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // الاسم والسعر
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          product.name,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${product.price} ${product.currency}',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // _buildInfoChip(
                      //   icon: Icons.category,
                      //   label: 'الفئة',
                      //   value: product.categoryId,
                      //   theme: theme,
                      // ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // الوصف
                  Center(
                    child: Text(
                      'الوصف',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      product.description.isNotEmpty
                          ? product.description
                          : 'لا يوجد وصف متاح',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onBackground.withOpacity(0.8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // معلومات إضافية
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     _buildInfoChip(
                  //       icon: Icons.store,
                  //       label: 'المتجر',
                  //       value: product.shopeId,
                  //       theme: theme,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // أزرار التحكم
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => _editProduct(context),
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
                      onPressed: ()
                          //=> _deleteProduct(context),
                          {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('حذف المنتج'),
                            content:
                                const Text('هل أنت متأكد من حذف هذا المنتج؟'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('إلغاء'),
                              ),
                              TextButton(
                                onPressed: () {
                                  ref
                                      .read(productNotifierProvider.notifier)
                                      .deleteProduct(product.id!);
                                  Navigator.pop(
                                      context); // لإغلاق الـ AlertDialog
                                  Navigator.pop(
                                      context); // للخروج من شاشة التفاصيل
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('تم حذف المنتج')),
                                  );
                                },
                                child: const Text('حذف',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
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
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildInfoChip({
  //   required IconData icon,
  //   required String label,
  //   required String value,
  //   required ThemeData theme,
  // }) {
  //   return Chip(
  //     avatar: Icon(icon, size: 18),
  //     label: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           label,
  //           style: theme.textTheme.bodySmall?.copyWith(
  //             color: theme.colorScheme.onSurface.withOpacity(0.6),
  //           ),
  //         ),
  //         Text(
  //           value,
  //           style: theme.textTheme.bodyMedium,
  //         ),
  //       ],
  //     ),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     backgroundColor: theme.colorScheme.surfaceVariant,
  //   );
  // }

  void _editProduct(BuildContext context) {
    // TODO: تنفيذ عملية التعديل
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('سيتم فتح شاشة التعديل')),
    );
  }

  // void _deleteProduct(BuildContext context) {
  //   // TODO: تنفيذ عملية الحذف

  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('حذف المنتج'),
  //       content: const Text('هل أنت متأكد من حذف هذا المنتج؟'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text('إلغاء'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(content: Text('تم حذف المنتج')),
  //             );
  //           },
  //           child: const Text('حذف', style: TextStyle(color: Colors.red)),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
