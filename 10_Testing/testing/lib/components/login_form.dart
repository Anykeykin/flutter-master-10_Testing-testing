import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/validate_email.dart';

class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool successMessage = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: Key('filedEmail'),
            validator: (value) {
              if (value == '') return 'Введите email';
              if (!validateEmail(value!))
                return 'Поле email заполнено не корректно';
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            key: Key('filedPhone'),
            validator: (value) {
              if (value == '') return 'Введите телефон';
              return null;
            },
            decoration: InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),],
          ),
          RaisedButton(
            child: Text('Отправить'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  successMessage = true;
                });
              }
            },
          ),
          if (successMessage) Text('Добро пожаловать'),
        ],
      ),
    );
  }
}
