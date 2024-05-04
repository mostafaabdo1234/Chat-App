import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({super.key, required this.onPressed,required this.message});
  final String message;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape:const StadiumBorder(),
        backgroundColor: Colors.purple,
        padding:const EdgeInsets.all(16),
      ),
      onPressed: onPressed, 
      child: Text(message,
      style:const TextStyle(
        fontSize: 20
      ),
      ));
  }
}