import 'package:flutter/material.dart';
import 'package:flutter_rfv2/infraestructure/sqflite_product_repository.dart';
import 'package:flutter_rfv2/infraestructure/database_migration.dart';
import 'package:flutter_rfv2/model/product.dart';
import 'package:flutter_rfv2/pages/product_detail_page.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductListPageState();
}

class ProductListPageState extends State<ProductListPage> {
  SqfliteProductRepository productRepository = SqfliteProductRepository(DatabaseMigration.get);
  List<Product> productsList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (productsList == null) {
      productsList = List<Product>();
      getData();
    }
    return Scaffold(
      body: productListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          navigateToDetail(Product('','',0,1));
        }
        ,
        tooltip: "Add new product",
        child: new Icon(Icons.add),
      ),
    );
  }
  
  ListView productListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getColor(this.productsList[position].categoryId),
              child:Text(this.productsList[position].categoryId.toString()),
            ),
          title: Text(this.productsList[position].name),
          subtitle: Text(this.productsList[position].description),
          onTap: () {
            navigateToDetail(this.productsList[position]);
          },
          ),
        );
      },
    );
  }
  
  void getData() {
      final productFuture = productRepository.getList();
      productFuture.then((courseList2) {
        setState(() {
          productsList = courseList2;
          count = courseList2.length;
        });
      });
  }

  Color getColor(int semester) {
    switch (semester) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.orange;
        break;
      case 3:
        return Colors.yellow;
        break;
      case 4:
        return Colors.green;
        break;
      default:
        return Colors.green;
    }
  }

  void navigateToDetail(Product product) async {
    
    bool result = await Navigator.push(context, 
        MaterialPageRoute(builder: (context) => ProductDetailPage(product)),
    );
    if (result == true) {
      getData();
    }
    
  }
}