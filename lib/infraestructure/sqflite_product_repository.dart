import 'package:flutter_rfv2/assemblers/product_assembler.dart';
import 'package:flutter_rfv2/infraestructure/product_repository.dart';
import 'package:flutter_rfv2/infraestructure/database_migration.dart';
import 'package:flutter_rfv2/model/product.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteProductRepository implements ProductRepository {
  final assembler = ProductAssembler();

  @override
  DatabaseMigration databaseMigration;

  SqfliteProductRepository(this.databaseMigration);

  @override
  Future<int> insert(Product product) async {
    final db = await databaseMigration.db();
    var id = await db.insert(assembler.tableName, assembler.toMap(product));
    return id;
  }

  @override
  Future<int> delete(Product product) async {
    final db = await databaseMigration.db();
    int result = await db.delete(assembler.tableName,
        where: assembler.columnId + " = ?", whereArgs: [product.id]);
    return result;
  }

  @override
  Future<int> update(Product product) async {
    final db = await databaseMigration.db();
    int result = await db.update(assembler.tableName, assembler.toMap(product),
        where: assembler.columnId + " = ?", whereArgs: [product.id]);
    return result;
  }

  @override
  Future<List<Product>> getList() async {
    final db = await databaseMigration.db();
    var result = await db.rawQuery("SELECT * FROM product order by categoryId ASC, name ASC");
    List<Product> products = assembler.fromList(result);
    return products;
  }

  Future<int> getCount() async {
    final db = await databaseMigration.db();
    var result = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM product')
    );
    return result;
  }
}