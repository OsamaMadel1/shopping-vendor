import 'package:app/orders/domain/entities/order_entity.dart';
import 'package:app/orders/domain/repositories/order_repository.dart';

class GetOrdersByshopeIdUseCase {
  final OrderRepository repository;

  GetOrdersByshopeIdUseCase(this.repository);

  Future<List<OrderEntity>> call(String shopeId) {
    return repository.getOrdersByshopeId(shopeId);
  }
}
