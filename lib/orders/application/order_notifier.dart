// import 'package:app/orders/application/order_state.dart';
// import 'package:app/orders/domain/usecase/fetch_orders_use_case.dart';
// import 'package:app/utils/error_handler.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class OrderNotifier extends StateNotifier<OrderState> {
//   final FetchOrdersUseCase fetchOrdersUseCase;
//   // final GetProductByIdUseCase getProductByIdUseCase;

//   OrderNotifier(
//     this.fetchOrdersUseCase,
//     // this.getProductByIdUseCase,
//   ) : super(OrderInitial());

//   Future<void> fetchOrders() async {
//     state = OrderLoading();
//     try {
//       final orders = await fetchOrdersUseCase();
//       state = OrderLoaded(orders);
//     } catch (e) {
//       final message = ErrorHandler.getMessage(e);
//       state = OrderError(message);
//     }
//   }
// }
