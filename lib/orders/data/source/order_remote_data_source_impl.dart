// import 'package:app/orders/data/models/order_model.dart';
// import 'package:app/orders/data/source/order_remote_data_source.dart';
// import 'package:dio/dio.dart';

// class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
//   final Dio dio;
//   OrderRemoteDataSourceImpl(this.dio);
//   @override
//   Future<List<OrderModel>> fetchOrders() async {
//     final response = await dio.get('orders');
//     if (response.statusCode == 200) {
//       final data = response.data as List;
//       return data.map((e) => OrderModel.fromJson(e)).toList();
//     } else {
//       throw Exception(response.data['errors'].toString());
//     }
//   }

//   @override
//   Future<OrderModel> getOrderById(String id) async {
//     final response = await dio.get('orders/$id');
//     if (response.statusCode == 200) {
//       final data = response.data;
//       return OrderModel.fromJson(data);
//     } else {
//       throw Exception(response.data['errors'].toString());
//     }
//   }
// }
