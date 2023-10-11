import 'package:flutter/material.dart';

class ItemLanguage extends StatelessWidget {
  final String? name;
  final String? value;
  final String? groupValue;
  final Function? onChanged;

  ItemLanguage(
      {@required this.name,
      @required this.value,
      @required this.groupValue,
      @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text(
            name!,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          groupValue: groupValue,
          value: value,
          onChanged: (languageCode) => onChanged!(languageCode, context),
        ),
        Divider(
          height: 0,
        ),
      ],
    );
  }
}
