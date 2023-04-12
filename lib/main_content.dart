import 'package:flutter/material.dart';
import 'package:flutterapp/history_view.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'big_card.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: HistoryView(),
          ),
          BigCard(pair: pair),
          SizedBox(height: 10),
          SizedBox(
            width: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text("Love")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  appState.getNext();
                },
                icon: Icon(Icons.skip_next),
                label: Text("Next"),
              )
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
