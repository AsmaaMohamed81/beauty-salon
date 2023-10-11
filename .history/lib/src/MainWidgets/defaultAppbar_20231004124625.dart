import 'package:flutter/material.dart';

AppBar defaultSimpleAppBar(
    {@required BuildContext context,
    @required String title,
    bool hasback = true}) {
  return AppBar(
      title:
          Text(title, style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: hasback
          ? InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.secondary))
          : null);
}
