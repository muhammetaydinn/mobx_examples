import 'package:flutter/material.dart';

//CatalogModel classı içinde static itemNames Listesi ve içindekiler
//Item return eden getById metodu int id parametre alıyor Item(id,itemNames[kafanagore]) donuyor
//Item return eden getByPosition metodu var int position alıyor return olarak getById(position) doner.
//Item
/*
  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
*/

class CatalogModel {
  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];
  Item getById(int id){
    return Item(id,itemNames[id%itemNames.length]);
  }
  Item getByPosition(int position){
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      // To make the sample app look nicer, each item is given one of the
      // Material Design primary colors.
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
