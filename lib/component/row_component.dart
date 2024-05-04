import 'package:flutter/material.dart';

class RowComponent extends StatelessWidget {
  const RowComponent({super.key, required this.newText, required this.text1, required this.onTap});
  final String newText,text1;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(newText),
        GestureDetector(
          onTap: onTap,
          child: Text(text1,
          style:const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
      ],
    );
  }
}