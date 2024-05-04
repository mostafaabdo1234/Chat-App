import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({super.key, required this.text, required this.icon, required this.onChanged,this.obscureText=false});
  final String text;
  final Icon icon;
  final Function(String) onChanged;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if(value!.isEmpty){
          return 'required field';
        }
        return null;
      },
      onChanged: onChanged,
      style:const TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        fillColor: Colors.purple.withOpacity(0.2),
        filled: true,
        hintText: text,
        prefixIcon: icon,
        prefixIconColor: Colors.purple,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.purple.withOpacity(0.1)
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.purple.withOpacity(0.1)
          )
        ),
      ),
    );
  }
}