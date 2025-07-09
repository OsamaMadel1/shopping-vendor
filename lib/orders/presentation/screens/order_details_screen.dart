// import 'package:app/orders/application/providers/order_by_id_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// class OrderDetailsScreen extends ConsumerWidget {
//   final String id;

//   const OrderDetailsScreen({super.key, required this.id});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final orderAsync = ref.watch(getOrderByIdProvider(id));

//     return Scaffold(
//       appBar: AppBar(title: const Text('تفاصيل الطلب')),
//       body: orderAsync.when(
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, _) => Center(child: Text('خطأ: $error')),
//         data: (order) {
//           return Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('رقم الطلب: ${order.id}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 Text('تاريخ الطلب: ${DateFormat('yyyy-MM-dd HH:mm').format(order.orderDate)}'),
//                 const SizedBox(height: 8),
//                 Text('الحالة: ${order.orderState}'),
//                 const SizedBox(height: 8),
//                 Text('الإجمالي: ${order.totalAmount}'),
//                 const SizedBox(height: 16),
//                 const Divider(),
//                 const Text('العناصر:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: order.orderItems.length,
//                     itemBuilder: (context, index) {
//                       final item = order.orderItems[index];
//                       return ListTile(
//                         title: Text(item.productName),
//                         subtitle: Text('الكمية: ${item.quantity}'),
//                         trailing: Text('${item.price}'),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:app/orders/application/providers/get_order_by_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends ConsumerWidget {
  final String id;

  const OrderDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(getOrderByIdProvider(id));

    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الطلب')),
      body: orderAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('خطأ: $error')),
        data: (order) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('رقم الطلب: ${order.id.substring(0, 8)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                    'تاريخ الطلب: ${DateFormat('yyyy-MM-dd HH:mm').format(order.orderDate)}'),
                const SizedBox(height: 8),
                Text('الحالة: ${order.orderState}'),
                const SizedBox(height: 8),
                Text('الإجمالي: ${order.totalAmount}'),
                const SizedBox(height: 16),
                const Divider(),
                const Text('العناصر:',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),

                /// ✅ العناصر
                ...order.orderItems.map(
                  (item) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text(item.productName),
                      subtitle: Text('الكمية: ${item.quantity}'),
                      trailing: Text('${item.price}'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
