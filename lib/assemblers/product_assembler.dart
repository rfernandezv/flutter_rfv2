import 'package:flutter_rfv2/assemblers/assembler.dart';
import 'package:flutter_rfv2/model/product.dart';

class ProductAssembler implements Assembler<Product> {
  final tableName = 'product';
  final columnId = 'id';
  final columnName = 'name';
  final columnDescription = 'description';
  final columnPrice = 'price';
  final columnCategoryId = 'categoryId';
  

  @override
  Product fromMap(Map<String, dynamic> query) {
    Product product = Product(query[columnName], query[columnDescription], query[columnPrice], query[columnCategoryId]);
    return product;
  }

  @override
  Map<String, dynamic> toMap(Product course) {
    return <String, dynamic>{
      columnName: course.name,
      columnDescription: course.description,
      columnPrice: course.price,
      columnCategoryId: course.categoryId
    };
  }

  Product fromDbRow(dynamic row) {
    return Product.withId(row[columnId], row[columnName], row[columnDescription], row[columnPrice], row[columnCategoryId]);
  }

  @override
  List<Product> fromList(result) {
    List<Product> productos = List<Product>();
    var count = result.length;
    for (int i = 0; i < count; i++) {
      productos.add(fromDbRow(result[i]));
    }
    return productos;
  }
}