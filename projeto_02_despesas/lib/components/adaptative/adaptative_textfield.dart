import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final TextInputType keyboardType;

  AdaptativeTextField({
    @required this.label,
    @required this.controller,
    @required this.onSubmitted,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: CupertinoTextField(
          controller: this.controller,
          onSubmitted: this.onSubmitted,
          placeholder: this.label,
          // no android o TextInputType.number já aparece
          // os separadores decimasi como vírgulas
          // no IOS não, portanto usamos o TextInputType.numberWithOptions
          // para dar a compatibilidade tambem para o IOS
          keyboardType: keyboardType,
          padding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12,
          ),
        ),
      );
    } else {
      // Android 
      return TextField(
        // _titleController é como um v-model do Vue
        // receberá o valor do TextField sempre
        // que ele for alterado
        controller: this.controller,
        onSubmitted: this.onSubmitted,
        decoration: InputDecoration(
          labelText: this.label,
        ),
        keyboardType: keyboardType,
      );
    }
  }
}
