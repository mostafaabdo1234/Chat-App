import 'package:flutter/material.dart';


void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.purple, content: Text(message)));
}