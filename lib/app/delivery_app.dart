import 'package:dw_delivery_app/app/core/provider/application_binding.dart';
import 'package:flutter/material.dart';

import './core/ui/theme/theme_config.dart';
import 'pages/home/home_router.dart';
import 'pages/splash/splash_page.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child:
          MaterialApp(title: 'Delivery App', theme: ThemeConfig.theme, routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => HomeRouter.page,
      }),
    );
  }
}
