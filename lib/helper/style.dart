import 'package:flutter/material.dart';

class Style{
  static InputDecoration textInputDecorSuffixPrefix(
      {Widget? iconSuffix, Widget? iconPrefix, String? textHint, String? label}) => InputDecoration(
    fillColor: Colors.white,
    filled: true,
    label: Text(label!),
    hintText: textHint,
    suffix: iconSuffix,
    prefix: iconPrefix,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: Colors.blue, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: Colors.blue,),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: const BorderSide(
          color: Colors.blue,),
    ),
    // isDense: true,
    // contentPadding: const EdgeInsets.all(12),
  );
}