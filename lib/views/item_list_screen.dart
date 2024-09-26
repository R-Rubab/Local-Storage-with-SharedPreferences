import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider_controller.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.indigo;
    const Color colors = Colors.white;
    const style = TextStyle(color: colors, fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text(
          'Local storage with shared preferences',
          style: style,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Consumer<ItemProvider>(
          builder: (context, itemProvider, child) {
            if (itemProvider.items.isEmpty) {
              return const Center(
                child: Text('No Data Exist'),
              );
            } else {
              return ListView.builder(
                itemCount: itemProvider.items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    color: color,
                    child: ListTile(
                      title: Text(
                        itemProvider.items[index],
                        style: style,
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: colors,
                        ),
                        onPressed: () {
                          itemProvider.removeItem(itemProvider.items[index]);
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        shape: const StadiumBorder(),
        elevation: 20,
        child: const Icon(
          Icons.add,
          color: colors,
        ),
        onPressed: () {
          // Adding item to the list
          // context.read<ItemProvider>().addItem('');
          context
              .read<ItemProvider>()
              .addItem('Item ${context.read<ItemProvider>().items.length + 1}');
        },
      ),
    );
  }
}
