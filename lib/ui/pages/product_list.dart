import 'package:f_shopping_app/ui/stprovider.dart';
import 'package:flutter/material.dart';
import '../../domain/product.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../Widgets/banner.dart';

class ProductList extends StatefulWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [CustomBanner(50), customAppBar()],
            ),
            Expanded(
              child: Consumer<StProvider>(builder: (context, provider, child) {
                List entries = provider.lista;
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      return _row(entries[index], index);
                    });
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    var provider = Provider.of<StProvider>(context);
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(product.name),
        Text(product.price.toString() +' USD'),
        Column(
          children: [
            IconButton(onPressed: (() => provider.increment(product)), icon: const Icon(Icons.arrow_upward)),
            IconButton(onPressed: (() => provider.decrement(product)), icon: const Icon(Icons.arrow_downward))
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.quantity.toString()),
            ),
          ],
        )
      ]),
    );
  }
}
