import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    String firstWord =
        "${pair.first[0].toUpperCase()}${pair.first.substring(1)}";
    String secWord =
        "${pair.second[0].toUpperCase()}${pair.second.substring(1)}";
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          "$firstWord $secWord",
          style: style,
          semanticsLabel: "$firstWord $secWord",
        ),
      ),
    );
  }
}
