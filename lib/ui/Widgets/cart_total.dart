import 'package:f_shopping_app/ui/stprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StProvider>(context);
    return Expanded(
      child: Center(
        child: Text(provider.getTotal().toString()+' USD',
            style: const TextStyle(
                fontSize: 25.0,
                color: Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
