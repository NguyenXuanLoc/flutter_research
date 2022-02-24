import 'package:flutter/cupertino.dart';
import 'package:flutter_research/widget/edit_text.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var keyForm = GlobalKey<FormState>();

  void validate() {
    if (keyForm.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Form(
        key: keyForm,
        child: EditText(
          labelText: "NAME",
          hintText: "Input Name",
        ),
      ),
    );
  }
}
