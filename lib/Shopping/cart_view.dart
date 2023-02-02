import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx_examples/Shopping/cart_model.dart';
import 'package:provider/provider.dart';

//cart list Builder donuyor ustunde cart degisken, watch ile CartModel tutuolr trailing remove button silince cart.remove,  title name
//CartTotal Row dönüyor Text koy cart.totalPrice koy kapa
//bosluk
// Textbutononpres  snackbar scaffold messenger
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.go('/catalog'),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<CartModel>().items.length,
        itemBuilder: (context, index) {
          final item = context.watch<CartModel>().items[index];
          return ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () => context.read<CartModel>().removeItem(item),
            ),
            title: Text(item.name),
          );
        },
      ),
      bottomNavigationBar: Row(
        children: [
          const Text("Total:"),
          Text(context.watch<CartModel>().totalPrice.toString()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Buying not supported yet"),
            ),
          );
        },
      ),
    );
  }
}
