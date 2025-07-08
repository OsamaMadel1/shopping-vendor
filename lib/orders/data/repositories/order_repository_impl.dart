// import 'package:app/orders/data/source/order_remote_data_source.dart';
// import 'package:app/orders/domain/entities/order_entity.dart';
// import 'package:app/orders/domain/repositories/order_repository.dart';

// class OrderRepositoryImpl implements OrderRepository {
//   final OrderRemoteDataSource orderRemoteDataSource;
//   OrderRepositoryImpl(this.orderRemoteDataSource);
//   @override
//   Future<List<OrderEntity>> fetchOrders() async {
//     return await orderRemoteDataSource.fetchOrders();
//   }

//   @override
//   Future<OrderEntity> getOrderById(String id) async {
//     return await orderRemoteDataSource.getOrderById(id);
//   }
// }
