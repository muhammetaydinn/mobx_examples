/*
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
*/

import 'package:flutter/material.dart';
import 'package:mobx_examples/Todo/viewmodel/todo_view_model.dart';
import 'package:mobx_examples/examples.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<TodoList>(create: (_) => TodoList()),
        ],
        child: MaterialApp(
          initialRoute: '/todos',
          routes: {
            '/': (_) => const ExampleList(),
          }..addEntries(
              examples.map((ex) => MapEntry(ex.path, ex.widgetBuilder))),
        ),
      );
}

class ExampleList extends StatelessWidget {
  const ExampleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Flutter MobX Examples'),
      ),
      body: ListView.builder(
        itemCount: examples.length,
        itemBuilder: (_, int index) {
          final ex = examples[index];

          return ListTile(
            title: Text(ex.title),
            subtitle: Text(ex.description),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => Navigator.pushNamed(context, ex.path),
          );
        },
      ));
}
