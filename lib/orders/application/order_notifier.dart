import 'package:app/orders/application/order_state.dart';
import 'package:app/orders/domain/usecase/get_orders_by_shop_id_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  final GetOrdersByshopeIdUseCase getOrdersByshopeIdUseCase;

  OrderNotifier(this.getOrdersByshopeIdUseCase) : super(const OrderState());

  Future<void> loadOrders(String shopeId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final orders = await getOrdersByshopeIdUseCase(shopeId);

      state = state.copyWith(
        isLoading: false,
        orders: orders,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
