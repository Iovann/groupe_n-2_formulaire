import 'package:flutter/material.dart';

class Inputwidget extends StatelessWidget {
  String? name;
  Widget? prefixIcon;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;


  Inputwidget({super.key,required this.name, this.onSaved, this.onChanged,this.validator, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          label: Text("$name"),
          hintText: '$name',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          // prefix: Icon(Icons.person),
          prefixIcon: prefixIcon,
          fillColor: Colors.white,
          filled: true),
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
