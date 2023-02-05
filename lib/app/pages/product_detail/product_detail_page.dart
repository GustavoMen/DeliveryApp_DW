import 'package:dw_delivery_app/app/core/extensions/formatter_mixin.dart';
import 'package:dw_delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:dw_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_delivery_app/app/models/product_model.dart';
import 'package:dw_delivery_app/app/pages/product_detail/product_detail_controller.dart';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/delivery_increment_decrement_button.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailPage({required this.product, super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeliveryAppbar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.screenWidth,
              height: context.percentHeight(0.4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.product.name,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Text(
                    widget.product.description,
                  ),
                ),
              ),
            ),
            const Divider(),
            Row(
              children: [
                BlocBuilder<ProductDetailController, int>(
                  builder: (context, amout) {
                    return Container(
                      width: context.percentWidth(0.5),
                      height: 68,
                      padding: const EdgeInsets.all(8),
                      child: DeliveryIncrementDecrementButton(
                        decrementTap: () {
                          controller.decrement();
                        },
                        incrementTap: () {
                          controller.increment();
                        },
                        amout: amout,
                      ),
                    );
                  },
                ),
                Container(
                  width: context.percentWidth(0.5),
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amout) {
                      return ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Adicionar',
                              style: context.textStyles.textExtraBold
                                  .copyWith(fontSize: 13),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                (widget.product.price * amout).currencyPTBR,
                                maxFontSize: 13,
                                minFontSize: 5,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: context.textStyles.textExtraBold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }
}