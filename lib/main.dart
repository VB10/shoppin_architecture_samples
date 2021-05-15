import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/managers/shop_manager.dart';
import 'features/tab/shop_tab_view.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ShopManager())],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.dark(),
      home: ShopTabView(),
    );
  }
}
