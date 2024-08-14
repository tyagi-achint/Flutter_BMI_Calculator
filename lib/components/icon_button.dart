import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.iconChild, this.onPressIconButton});

  final IconData iconChild;
  final VoidCallback? onPressIconButton;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        iconChild,
        color: Color(0xFFFFFFFF),
        size: 25,
      ),
      onPressed: onPressIconButton,
      elevation: 0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
