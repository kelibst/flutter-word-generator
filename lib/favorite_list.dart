import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }
    return ListView.builder(
      itemCount: appState.favorites.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
          child: Card(
            child: ListTile(
                onTap: () {
                  print(index);
                },
                onLongPress: () {
                  appState.removeFavorite(appState.favorites[index]);
                },
                title: Text(
                  "${appState.favorites[index].first} ${appState.favorites[index].second}",
                )),
          ),
        );
      },
    );
  }
}
