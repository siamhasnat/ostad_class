import 'package:flutter/material.dart';

void main() {
  runApp(MyShoppingListApp());
}

class MyShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Shopping List"),
          centerTitle: true, // Center the title
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Handle cart button tap here
              },
            ),
          ],
        ),
        body: ShoppingList(),
      ),
    );
  }
}

class ShoppingList extends StatelessWidget {
  final List<Map<String, dynamic>> shoppingItems = [
    {"name": "Apples", "icon": Icons.shopping_basket},
    {"name": "Bananas", "icon": Icons.shopping_basket},
    {"name": "Milk", "icon": Icons.liquor_rounded},
    {"name": "Eggs", "icon": Icons.local_grocery_store},
    {"name": "Bread", "icon": Icons.local_grocery_store},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoppingItems.length,
      itemBuilder: (context, index) {
        final item = shoppingItems[index];
        return ListTile(
          leading: Icon(item["icon"]), // Icon for the item
          title: Text(item["name"]), // Name of the item
          onTap: () {
            // Add item to cart or perform some action when item is tapped
          },
        );
      },
    );
  }
}

