import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rfv2/components/reusable_card.dart';
import 'package:flutter_rfv2/components/drawer.dart';
import 'package:flutter_rfv2/routes/routes.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Inkafarma'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      Navigator.pushReplacementNamed(context, Routes.products);
                    },
                    color: Colors.green,
                    cardChild:                      
                             new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.shoppingBag, size: 110, color: Colors.green[800]),
                                    Text(''),
                                    Text('Productos')
                                  ],
                                ), 
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      
                    },
                    color: Colors.green,
                    cardChild:  new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.user, size: 110, color: Colors.green[800]),
                                    Text(''),
                                    Text('Pedidos')
                                  ],
                                ), 
                  ),
                ),
              ],
            ),
          ),         
        ],
      ),
    );
  }

}
