import 'package:flutter/material.dart';

import 'catalog_model.dart';
//CartModelimiz var ChangeNotifier extends ediyoruz
//  private late Catalogmmodel ornegi belirliyorz.
// private final int List itemIds belirliyorz içi boş
// CatalogModel tipinde catalog return eden get kodu yazıyoruz
//parametre CatalogModel içeren bir set kodu ve notifyListeners
// Item Listesi items get kodu itemIds mapleyip catalogdan getbyid ile id alıp listeliyor.
// int  total price get kodu items.fold ile total + current.price
// spete item ekleme kodu void itemIds id ekliyor notifyListener var
//remove aynısı üsttekinin

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
  void addItem(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }
   void removeItem(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
