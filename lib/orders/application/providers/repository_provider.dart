import 'package:app/orders/application/providers/data_source_provider.dart';
import 'package:app/orders/data/repositories/order_repository_impl.dart';
import 'package:app/orders/domain/repositories/order_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Repository
final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final remote = ref.watch(orderRemoteDataSourceProvider);
  return OrderRepositoryImpl(remote);
});
