import 'package:dw_delivery_app/app/core/ui/helpers/messages.dart';
import 'package:dw_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_delivery_app/app/models/product_model.dart';
import 'package:dw_delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';

import '../../core/ui/helpers/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // showLoader();
          // await Future.delayed(
          //   Duration(seconds: 2),
          // );
          // hideLoader();
          showError('Erro ao criar');
          await Future.delayed(
            Duration(seconds: 2),
          );
          showInfo('message');
          await Future.delayed(
            Duration(seconds: 2),
          );
          showSuccess('message');
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductTile(
                  product: ProductModel(
                      id: 0,
                      name: 'Lanche x',
                      description: 'description',
                      price: 15.0,
                      image:
                          "https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
