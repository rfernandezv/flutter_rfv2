import 'package:flutter/material.dart';
import 'package:flutter_rfv2/components/drawer.dart';
import 'package:flutter_rfv2/pages/product_list_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rfv2/common/app_constants.dart';
import 'package:flutter_rfv2/routes/routes.dart';


class ProductsView extends StatelessWidget {
  Widget content = ProductListPage();
  static const String routeName = '/products';

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          brightness: Brightness.dark,
          centerTitle: true,
          title: Text(
            'Productos',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(FontAwesomeIcons.bars,
                  size: 25, color: Colors.green[800]),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(FontAwesomeIcons.home,
                    size: 25, color: Colors.green[800]),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
            ),
          ],
        ),
      ),
      body: content,
      //bottomNavigationBar: _indexBottom(),
    );
  }


}