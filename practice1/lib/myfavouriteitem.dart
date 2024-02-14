import 'package:flutter/material.dart';
import 'package:practice1/provider/favouriteprovider.dart';
import 'package:provider/provider.dart';

class MyFavouriteItem extends StatefulWidget {
  const MyFavouriteItem({super.key});

  @override
  State<MyFavouriteItem> createState() => _MyFavouriteItemState();
}

class _MyFavouriteItemState extends State<MyFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final favouriteprovider = Provider.of<FavouriteItemProvider>(
        context); //It is used to obtain the current value of a provided object
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favourites'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteprovider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      // ignore: prefer_interpolation_to_compose_strings
                      title: Text('item' + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline_outlined),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
