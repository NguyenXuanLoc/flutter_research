import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String validateCharacter;
  final String messageValidateText;
  final TextEditingController controller;
  final Color errorBorderColor;
  final Color errorTextColor;
  final Color focusBorderColor;
  final double borderRadius;

  const EditText({
    Key key,
    this.labelText,
    this.hintText,
    this.validateCharacter,
    this.messageValidateText,
    this.controller,
    this.errorBorderColor = Colors.red,
    this.focusBorderColor = Colors.black,
    this.borderRadius = 10,
    this.errorTextColor = Colors.red,
  }) : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          errorStyle: TextStyle(color: widget.errorBorderColor),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.errorTextColor),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.focusBorderColor),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius))),
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.focusBorderColor),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.focusBorderColor),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.focusBorderColor),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius))),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.black)),
      onSaved: (String value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String value) {
        return (value != null && value.contains('@'))
            ? 'Do not use the @ char.'
            : null;
      },
    );
  }
}
