import 'package:flutter/material.dart';
import 'package:flutter_rfv2/infraestructure/sqflite_product_repository.dart';
import 'package:flutter_rfv2/infraestructure/database_migration.dart';
import 'package:flutter_rfv2/model/product.dart';
import 'package:flutter_rfv2/components/fancy_button.dart';

SqfliteProductRepository courseRepository =
    SqfliteProductRepository(DatabaseMigration.get);
final List<String> choices = const <String>[
  'Save Product & Back',
  'Delete Product',
  'Back to List'
];

const mnuSave = 'Save Product & Back';
const mnuDelete = 'Delete Product';
const mnuBack = 'Back to List';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  ProductDetailPage(this.product);

  @override
  State<StatefulWidget> createState() => ProductDetailPageState(product);
}

class ProductDetailPageState extends State<ProductDetailPage> {
  Product product;
  ProductDetailPageState(this.product);
  final _formKey = GlobalKey<FormState>();
  final categoryList = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(product.name),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: select,
            itemBuilder: (BuildContext context) {
              return choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        _showNameProduct(textStyle, this.product.name),
                        _showDescriptionProduct(
                            textStyle, this.product.description),
                        _showPriceProduct(
                            textStyle, this.product.price.toString()),
                      ],
                    ))),
            FancyButton(
              key: UniqueKey(),
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                select(mnuSave);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _showNameProduct(TextStyle textStyle, String initialValue) {
    return TextFormField(
      initialValue: initialValue,
      style: textStyle,
      onSaved: (val) => product.name = val,
      validator: (val) => val.length < 1 ? 'Name is too short' : null,
      decoration: InputDecoration(
          labelText: "Name",
          labelStyle: textStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          )),
    );
  }

  Widget _showPriceProduct(TextStyle textStyle, String initialValue) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
        child: TextFormField(
          initialValue: initialValue,
          onSaved: (val) => product.price = double.parse(val),
          validator: (val) => val.length < 1
              ? 'Please type a price'
              : (double.parse(val) <= 0
                  ? 'Please, price must be greater than zero '
                  : null),
          style: textStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "Price",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
        ));
  }

  Widget _showDescriptionProduct(TextStyle textStyle, String initialValue) {
    return Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: TextFormField(
          initialValue: initialValue,
          style: textStyle,
          onSaved: (val) => product.description = val,
          validator: (val) => val.length < 1 ? 'Name is too short' : null,
          decoration: InputDecoration(
              labelText: "Description",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
        ));
  }

  void select(String value) async {
    int result;
    switch (value) {
      case mnuSave:
        submit();
        break;
      case mnuDelete:
        Navigator.pop(context, true);
        if (product.id == null) {
          return;
        }
        result = await courseRepository.delete(product);
        if (result != 0) {
          AlertDialog alertDialog = AlertDialog(
            title: Text("Delete Course"),
            content: Text("The Course has been deleted"),
          );
          showDialog(context: context, builder: (_) => alertDialog);
        }
        break;
      case mnuBack:
        Navigator.pop(context, true);
        break;
      default:
    }
  }

  void submit() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      save();
    }
  }

  void save() {
    if (product.id != null) {
      debugPrint('update');
      courseRepository.update(product);
    } else {
      debugPrint('insert');
      courseRepository.insert(product);
    }
    Navigator.pop(context, true);
  }

  void updateCategory(String value) {
    switch (value) {
      case "1":
        product.categoryId = 1;
        break;
      case "2":
        product.categoryId = 2;
        break;
      case "3":
        product.categoryId = 3;
        break;
      case "4":
        product.categoryId = 4;
        break;
    }
    setState(() {
      //semester = int.parse(value);
    });
  }

  int retrieveCategory(int value) {
    return categoryList[value - 1];
  }
}
