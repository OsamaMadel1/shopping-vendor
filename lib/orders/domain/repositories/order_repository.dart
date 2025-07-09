import 'package:app/orders/domain/entities/order_entity.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getOrdersByshopeId(String shopeId);
  Future<OrderEntity> getOrderById(String orderId);
}
