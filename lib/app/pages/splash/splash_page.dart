import '../../core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import '../../core/ui/helpers/size_extensions.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(0.30),
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 80,
                  ),
                  DeliveryButton(
                    label: 'ACESSAR',
                    onPressed: () {},
                    width: context.percentWidth(0.6),
                    height: 35,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
