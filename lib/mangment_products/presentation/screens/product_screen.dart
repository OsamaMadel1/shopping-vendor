// import 'package:app/category/application/providers/category_notifier_provider.dart';
// import 'package:app/category/presentation/widgets/category_multi_select_dialog.dart';
// import 'package:app/core/presentation/widgets/button_widget.dart';
// import 'package:app/mangment_products/application/product_state.dart';
// import 'package:app/mangment_products/application/providers/product_notifier_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';
// import 'package:go_router/go_router.dart';

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       ref.read(productNotifierProvider.notifier).fetchProducts();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productState = ref.watch(productNotifierProvider);

//     ref.listen<ProductState>(productNotifierProvider, (previous, next) {
//       if (next is ProductError) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(next.message)),
//         );
//       }
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('product Screen'),
//         backgroundColor: Colors.amber.shade300,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.filter_alt),
//             tooltip: "فلترة حسب الفئات",
//             onPressed: () async {
//               final selected = await showDialog<List<String>>(
//                 context: context,
//                 builder: (_) => const CategoryMultiSelectDialog(),
//               );

//               if (selected != null && selected.isNotEmpty) {
//                 // نفذ الفلترة بناءً على الفئات المحددة
//                 // مثلًا: ref.read(productNotifierProvider.notifier).fetchByCategories(selected)
//                 // مؤقتًا نجلب أول فئة فقط إذا أردت اختبارك المبدئي:
//                 ref // حسب فئة
//                     .read(productNotifierProvider.notifier)
//                     .fetchProductsByCategory(selected.first);

//                 // ref// متعددة الفئات
//                 //     .read(productNotifierProvider.notifier)
//                 //     .fetchProductsByCategories(selected);
//               }
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(child: _buildBody(productState)),
//           Gap(5),
//           ButtonWidget(
//             text: "Add Product",
//             onTap: () {
//               context.push('/addProductScreen');
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBody(ProductState state) {
//     if (state is ProductInitial || state is ProductLoading) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (state is ProductLoaded) {
//       if (state.products.isEmpty) {
//         return const Center(child: Text('not products'));
//       }

//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           itemCount: state.products.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // صورتان في كل سطر
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 0.75, // تناسق البطاقة
//           ),
//           itemBuilder: (context, index) {
//             final product = state.products[index];
//             return _buildProductCard(product);
//           },
//         ),
//       );
//     } else if (state is ProductError) {
//       return Center(child: Text('خطأ: ${state.message}'));
//     } else {
//       return const SizedBox.shrink();
//     }
//   }

//   Widget _buildProductCard(product) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 4,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(15)),
//               child: Image.asset(
//                 // product.image ??
//                 'assets/images/logo.png', // رابط صورة مؤقتة
//                 fit: BoxFit
//                     .cover, //يملأ الصورة كامل المساحة مع اقتطاع الأطراف إذا لزم الأمر (للمظهر الجميل).
//                 errorBuilder: (context, error, stackTrace) =>
//                     const Icon(Icons.image_not_supported),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text(
//                       product.name,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       'price: ${product.price}${product.currency}',
//                       style: const TextStyle(color: Colors.teal),
//                     ),
//                   ],
//                 ),
//                 Gap(5),
//                 Center(
//                   child: ButtonWidget(
//                     text: 'detials',
//                     onTap: () {
//                       // TODO: الانتقال لشاشة تفاصيل المنتج

//                       context.push('/productDetailsScreen', extra: product);
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:app/authentication/application/providers/auth_notifier_provider.dart';
import 'package:app/category/application/providers/category_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_hero/local_hero.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:app/core/presentation/widgets/button_widget.dart';
import 'package:app/category/presentation/widgets/category_select_dialog.dart';
import 'package:app/mangment_products/application/providers/product_notifier_provider.dart';
import 'package:app/mangment_products/application/product_state.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  bool _isGrid = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(productNotifierProvider.notifier)
          .fetchProducts(shopId: ref.read(authNotifierProvider).shopId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productNotifierProvider);

    ref.listen<ProductState>(productNotifierProvider, (previous, next) {
      if (next is ProductError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message)),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('product Screen'),
        backgroundColor: Colors.amber.shade300,
        actions: [
          IconButton(
            icon: Icon(_isGrid ? Icons.grid_view : Icons.view_list),
            onPressed: () {
              setState(() => _isGrid = !_isGrid);
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt),
            tooltip: "فلترة حسب الفئة",
            onPressed: () async {
              final selectedCategoryId = await showDialog<String?>(
                context: context,
                builder: (_) => const CategorySelectDialog(),
              );

              if (selectedCategoryId != null && selectedCategoryId.isNotEmpty) {
                final state = ref.read(categoryNotifierProvider);
                final selectedCategory = state.categories.firstWhere(
                  (cat) => cat.id == selectedCategoryId,
                  // orElse: () => null,
                );

                //  if (selectedCategory  != null) {
                final shopId = ref.read(authNotifierProvider).shopId;
                final categoryName = selectedCategory.name; // نأخذ الاسم

                ref
                    .read(productNotifierProvider.notifier)
                    .fetchProducts(shopId: shopId, categoryName: categoryName);
                // }
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildBody(productState)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ButtonWidget(
              text: "add product",
              onTap: () {
                context.push('/addProductScreen');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(ProductState state) {
    if (state is ProductInitial || state is ProductLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ProductLoaded) {
      if (state.products.isEmpty) {
        return const Center(child: Text('لا توجد منتجات'));
      }

      final products = state.products;

      return LocalHeroScope(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            child: _isGrid
                ? GridView.builder(
                    key: const ValueKey('gridView'),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return _buildProductCard(product, 'product_$index');
                    },
                  )
                : ListView.builder(
                    key: const ValueKey('listView'),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return _buildProductCard(product,
                          'product_${_isGrid ? 'grid' : 'list'}_$index');
                    },
                  ),
          ),
        ),
      );
    } else if (state is ProductError) {
      return Center(child: Text('خطأ: ${state.message}'));
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildProductCard(product, String heroTag) {
    return LocalHero(
      tag: heroTag,
      child: SizedBox(
        height: _isGrid ? 280 : 140,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: _isGrid
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'price: ${product.price}${product.currency}',
                                style: const TextStyle(color: Colors.teal),
                              ),
                            ],
                          ),
                          const Gap(5),
                          Center(
                            child: ButtonWidget(
                              text: 'details',
                              onTap: () {
                                // context.push('/productDetailsScreen',
                                //     extra: product);
                                context.pushNamed(
                                  'productDetailsScreen',
                                  pathParameters: {'id': product.id!},
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(15)),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 120,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.image_not_supported),
                      ),
                    ),
                    const Gap(30),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'price: ${product.price}${product.currency}',
                              style: const TextStyle(color: Colors.teal),
                            ),
                            const Gap(5),
                            Align(
                              alignment: Alignment.center,
                              child: ButtonWidget(
                                text: 'details',
                                onTap: () {
                                  context.pushNamed('productDetailsScreen',
                                      pathParameters: {'id': product.id!});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
