import 'package:app/mangment_products/application/providers/data_source_provider.dart';
import 'package:app/mangment_products/data/repositories/product_repository_impl.dart';
import 'package:app/mangment_products/domain/repositories/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Repository
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final remote = ref.watch(productRemoteDataSourceProvider);
  return ProductRepositoryImpl(remote);
});
