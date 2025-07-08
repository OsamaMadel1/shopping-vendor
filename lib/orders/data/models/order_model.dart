// import 'package:app/orders/domain/entities/order_entity.dart';

// class OrderModel extends OrderEntity {
//   OrderModel({
//     required super.id,
//     required super.productName,
//     required super.custumName,
//     required super.quantity,
//     required super.totalPrice,
//     required super.orderDate,
//     required super.status,
//   });
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'productName': productName,
//       'custumName': custumName,
//       'quantity': quantity,
//       'totalPrice': totalPrice,
//       'orderDate': orderDate,
//       'status': status
//     };
//   }

//   factory OrderModel.fromJson(Map<String, dynamic> json) {
//     return OrderModel(
//       id: json['id'] as String,
//       productName: json['productName'] as String,
//       custumName: json['custumName'] as String,
//       quantity: json['quantity'] as int,
//       totalPrice: (json['totalPrice'] as num).toDouble(),
//       orderDate: DateTime.parse(json['orderDate'] as String),
//       status: _orderStatusFromString(json['status'] as String),
//     );
//   }

//   static OrderStatus _orderStatusFromString(String status) {
//     switch (status.toLowerCase()) {
//       case 'pending':
//         return OrderStatus.pending;
//       case 'inprogress':
//       case 'in_progress':
//         return OrderStatus.inProgress;
//       case 'indelivery':
//       case 'in_delivery':
//         return OrderStatus.inDelivery;
//       case 'completed':
//         return OrderStatus.completed;
//       case 'cancelled':
//         return OrderStatus.cancelled;
//       default:
//         throw Exception('Unknown order status: $status');
//     }
//   }
// }
