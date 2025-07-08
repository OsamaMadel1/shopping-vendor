// import 'package:app/orders/application/order_state.dart';
// import 'package:app/orders/application/providers/order_notifier_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// class OrdersScreen extends ConsumerWidget {
//   const OrdersScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final orderState = ref.watch(orderNotifierProvider);

//     // الاستماع للأخطاء وعرض Snackbar
//     ref.listen<OrderState>(orderNotifierProvider, (previous, next) {
//       if (next is OrderError) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(next.message)),
//         );
//       }
//     });

//     // طلب تحميل الطلبات عند فتح الشاشة (إذا لم يكن محمّل بعد)
//     ref.read(orderNotifierProvider.notifier).fetchOrders();

//     if (orderState is OrderInitial || orderState is OrderLoading) {
//       return Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     } else if (orderState is OrderLoaded) {
//       if (orderState.orders.isEmpty) {
//         return Scaffold(
//           body: Center(child: Text('لا توجد طلبات')),
//         );
//       }
//       return Scaffold(
//         // appBar: AppBar(title: const Text('الطلبات')),
//         body: ListView.builder(
//           itemCount: orderState.orders.length,
//           itemBuilder: (context, index) {
//             final order = orderState.orders[index];
//             return ListTile(
//               title: Text(order.productName),
//               subtitle: Text('العميل: ${order.custumName}\n'
//                   'الكمية: ${order.quantity}\n'
//                   'الحالة: ${order.status.name}'),
//               isThreeLine: true,
//               onTap: () {
//                 context.pushNamed(
//                   'orderDetailsScreen',
//                   pathParameters: {'id': order.id},
//                 );
//                 // TODO: انتقل إلى شاشة تفاصيل الطلب مع تمرير order.id
//               },
//             );
//           },
//         ),
//       );
//     } else if (orderState is OrderError) {
//       return Scaffold(
//         // appBar: AppBar(title: const Text('الطلبات')),
//         body: Center(child: Text('حدث خطأ: ${orderState.message}')),
//       );
//     } else {
//       return const SizedBox.shrink();
//     }
//   }
// }
