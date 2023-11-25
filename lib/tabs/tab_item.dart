import 'package:flutter/material.dart';

import '../model/source_response.dart';
import '../my_theme.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TabItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
        color: isSelected? MyTheme.primaryColor:
          Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: MyTheme.primaryColor,
          width: 3
        )
      ),
      child: Text(source.name??'',
      style: isSelected?
      Theme.of(context).textTheme.titleLarge:
          Theme.of(context).textTheme.titleSmall!.copyWith(
              color: MyTheme.primaryColor)
      )
    );
  }
}
