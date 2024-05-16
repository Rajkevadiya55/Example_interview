import 'package:demo/controller/favourite_player_controller.dart';
import 'package:demo/controller/login_controller.dart';
import 'package:demo/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController(), fenix: true);
        Get.lazyPut(() => FavouritePlayerController(), fenix: true);
      }),
      home: const LoginPage(),
    );
  }
}
