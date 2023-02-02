// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:mobx_examples/Shopping/catalog_model.dart';

import 'cart_model.dart';

//CustomScrollView SliverList SliverChildBuilderDelegate
//
//ListItem final int index alır .  var item de context select CatalogModel,Item ile gelir . catalog.getbyPosition(index) atanır
//return olarak Row içinde color: item.color,    item.name,   _AddButton(item: item), alır
//
// Item item alan addbuton iisncart contexten alıyon cartmodel, bool contains(item) donuyon içte
//textbuton isinkart kontrolu null ya da var carta read ile Card Model ata, add ile ekle itemi
//isinCart kotrolu ile added ya da add yaz
//
// appbar actions  context.go('/catalog/cart')

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => MyListItem(index: index)),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text("Catalog"),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => context.go('/catalog/cart'),
        )
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  final Item item;
  const AddButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    final isInCart = cart.items.contains(item);
    return TextButton(
      onPressed: () {
        if (isInCart) {
          cart.removeItem(item);
        } else {
          cart.addItem(item);
        }
      },
      child: Text(isInCart ? "Added" : "Add"),
    );
  }
}

class MyListItem extends StatelessWidget {
  final int index;
  const MyListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalog =
        context.select<CatalogModel, CatalogModel>((value) => value);
    final item = catalog.getByPosition(index);
    return Row(
      children: [
        Container(
          color: item.color,
          width: 48,
          height: 48,
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(item.name)),
        const SizedBox(width: 12),
        AddButton(item: item),
      ],
    );
  }
}
