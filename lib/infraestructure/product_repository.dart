import 'package:flutter_rfv2/infraestructure/database_migration.dart';
import 'package:flutter_rfv2/model/product.dart';

abstract class ProductRepository {
  DatabaseMigration databaseMigration;
  Future<int> insert(Product producto);
  Future<int> update(Product producto);
  Future<int> delete(Product producto);
  Future<List<Product>> getList();
}