import 'package:app/orders/data/models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getOrdersByshopId(String shopId);
  Future<OrderModel> getOrderById(String orderId);
}
