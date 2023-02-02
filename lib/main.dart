import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx_examples/Shopping/cart_view.dart';
import 'package:provider/provider.dart';

import 'Shopping/cart_model.dart';
import 'Shopping/catalog_model.dart';
import 'Shopping/catalog_view.dart';

void main() {
  runApp(const MyApp());
}
// normal main
// MyApp MuLtiProvider return ediiyor. içinde provider CatalogModel ve ChangeNotifierProxyProvider CatalogModel,CartModel bu CartModel yaratıyo cart null kontrol arguman notnull cart error ardından cart.catalog catalog ataması ve cart return ediliyor.
//child olarak MaterialApp router router config router

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CatalogModel(),
        ),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw Exception("Cart is null");
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: routes(),
      ),
    );
  }
}

GoRouter routes() {
  return GoRouter(initialLocation: '/catalog', routes: [
    GoRoute(
      path: '/catalog',
      builder: (context, state) => const CatalogView(),
      routes: [
        GoRoute(
          path: 'cart',
          builder: (context, state) => const CartView(),
        ),
      ],
    ),
  ]);
}
