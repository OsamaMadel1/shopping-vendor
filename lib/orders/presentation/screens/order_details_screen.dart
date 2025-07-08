// // import 'package:app/orders/domain/entities/order_entity.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// // class OrderDetailsScreen extends StatelessWidget {
// //   final OrderEntity order;

// //   const OrderDetailsScreen({super.key, required this.order});

// //   @override
// //   Widget build(BuildContext context) {
// //     final formattedDate = DateFormat.yMMMMd().format(order.orderDate);

// //     return Scaffold(
// //       appBar: AppBar(title: const Text('تفاصيل الطلب')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             _buildDetail(title: 'المنتج', value: order.productName),
// //             _buildDetail(title: 'اسم العميل', value: order.custumName),
// //             _buildDetail(title: 'الكمية', value: order.quantity.toString()),
// //             _buildDetail(title: 'السعر الكلي', value: '${order.totalPrice.toStringAsFixed(2)} \$'),
// //             _buildDetail(title: 'تاريخ الطلب', value: formattedDate),
// //             _buildDetail(title: 'الحالة', value: _statusText(order.status)),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDetail({required String title, required String value}) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: Row(
// //         children: [
// //           Expanded(flex: 2, child: Text('$title:', style: const TextStyle(fontWeight: FontWeight.bold))),
// //           const SizedBox(width: 8),
// //           Expanded(flex: 3, child: Text(value)),
// //         ],
// //       ),
// //     );
// //   }

// //   String _statusText(OrderStatus status) {
// //     switch (status) {
// //       case OrderStatus.pending:
// //         return 'قيد الانتظار';
// //       case OrderStatus.inProgress:
// //         return 'قيد التحضير';
// //       case OrderStatus.inDelivery:
// //         return 'قيد التوصيل';
// //       case OrderStatus.completed:
// //         return 'مكتمل';
// //       case OrderStatus.cancelled:
// //         return 'ملغي';
// //     }
// //   }
// // }
// import 'package:app/orders/domain/entities/order_entity.dart';
// import 'package:app/orders/application/providers/get_order_by_id_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// class OrderDetailsScreen extends ConsumerWidget {
//   final String orderId;

//   const OrderDetailsScreen({super.key, required this.orderId});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final orderAsync = ref.watch(getOrderByIdProvider(orderId));

//     return Scaffold(
//       appBar: AppBar(title: const Text('تفاصيل الطلب')),
//       body: orderAsync.when(
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, _) => Center(child: Text("حدث خطأ: $error")),
//         data: (order) {
//           final formattedDate = DateFormat.yMMMMd().format(order.orderDate);

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildDetail(title: 'اسم المنتج', value: order.productName),
//                 _buildDetail(title: 'اسم العميل', value: order.custumName),
//                 _buildDetail(title: 'الكمية', value: order.quantity.toString()),
//                 _buildDetail(
//                     title: 'السعر الكلي',
//                     value: '${order.totalPrice.toStringAsFixed(2)} \$'),
//                 _buildDetail(title: 'تاريخ الطلب', value: formattedDate),
//                 _buildDetail(title: 'الحالة', value: _statusText(order.status)),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildDetail({required String title, required String value}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//               flex: 2,
//               child: Text('$title:',
//                   style: const TextStyle(fontWeight: FontWeight.bold))),
//           const SizedBox(width: 8),
//           Expanded(flex: 3, child: Text(value)),
//         ],
//       ),
//     );
//   }

//   String _statusText(OrderStatus status) {
//     switch (status) {
//       case OrderStatus.pending:
//         return 'قيد الانتظار';
//       case OrderStatus.inProgress:
//         return 'قيد التحضير';
//       case OrderStatus.inDelivery:
//         return 'قيد التوصيل';
//       case OrderStatus.completed:
//         return 'مكتمل';
//       case OrderStatus.cancelled:
//         return 'ملغي';
//     }
//   }
// }
