import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_app/models/first_form_model.dart';
import 'package:provider/src/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _userName;
  String? _password;
  String? _email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Username',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Username.';
              }

              return null;
            },
            onSaved: (value) {
              _userName = value;
            },
            initialValue: context.read<FirstFormModel>().userName,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Password',
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Password.';
              }

              return null;
            },
            onSaved: (value) {
              _password = value;
            },
            initialValue: context.read<FirstFormModel>().password,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Email.';
              }

              return null;
            },
            onSaved: (value) {
              _email = value;
            },
            initialValue: context.read<FirstFormModel>().email,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<FirstFormModel>().userName = _userName;
                context.read<FirstFormModel>().password = _password;
                context.read<FirstFormModel>().email = _email;

                //Navigator.pop(context, 'Register completed');
                Navigator.pushNamed(context, '/8');
              }
            },
            child: Text('Validate'),
          ),
        ],
      ),
    );
  }
}
