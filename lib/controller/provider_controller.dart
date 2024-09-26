
// --------------
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemProvider with ChangeNotifier {
  List<String> _items = [];
  // int _itemCounter = 0;
  List<String> get items => _items;

  ItemProvider() {
    loadItems(); // Load items when the provider is created
  }

  void addItem(String item) {
    //   _itemCounter++; // Increment the counter
    // _items.add('Item $_itemCounter');
    _items.add(item);
    saveItems();
    notifyListeners(); // Notify UI to update
  }

  void removeItem(String item) {
    _items.remove(item);
    saveItems();
    notifyListeners(); // Notify UI to update
  }

  Future<void> saveItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('itemList', _items);
      //  await prefs.setInt('itemCounter', _itemCounter); 
  }

  Future<void> loadItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _items = prefs.getStringList('itemList') ?? [];
    //  _itemCounter = prefs.getInt('itemCounter') ?? 0; 
    notifyListeners(); // Notify UI to update
  }
}
