import 'package:app/core/presentation/widgets/text_widget.dart';
import 'package:app/orders/application/providers/get_order_by_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends ConsumerWidget {
  final String id;

  const OrderDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(getOrderByIdProvider(id));

    return Scaffold(
      appBar:
          AppBar(title: Center(child: const TextWidget(text: 'تفاصيل الطلب'))),
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
                const Gap(8),
                Text(
                    'تاريخ الطلب: ${DateFormat('yyyy-MM-dd HH:mm').format(order.orderDate)}'),
                const Gap(8), Text('الحالة: ${order.orderState}'),
                const Gap(8),
                Text('الإجمالي: ${order.totalAmount}'),
                const Gap(16),
                const Divider(),
                Center(
                    child: const TextWidget(
                  text: 'العناصر',
                  fontSize: 16,
                )),
                const Gap(8),

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
