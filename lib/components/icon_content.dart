import 'package:flutter/material.dart';

import 'constants.dart';

class iconContent extends StatelessWidget {
  iconContent({required this.iconName, this.iconLabel});
  final iconName;
  final iconLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          iconLabel,
          style: kLabelStyle,
        )
      ],
    );
  }
}
