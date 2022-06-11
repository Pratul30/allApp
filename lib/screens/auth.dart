import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth.dart';

class AuthScreen extends StatelessWidget {
  var pass;
  var confirmPass;
  var email;

  final passFocusNode = FocusNode();
  final confirmFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void onSave() {
      final isvalid = formKey.currentState!.validate();
      if (!isvalid) {
        return;
      }
      formKey.currentState!.save();
      Provider.of<Auth>(context, listen: false).signUp(
        email,
        pass,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Color(0xffe96443),
        //       Color(0xff904e95),
        //     ],
        //   ),
        // ),
        child: Container(
          height: 300,
          width: 250,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Email'),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please enter an email.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(passFocusNode);
                    },
                    textInputAction: TextInputAction.next,
                    onSaved: (val) {
                      email = val;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Password'),
                    ),
                    focusNode: passFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(confirmFocusNode);
                    },
                    textInputAction: TextInputAction.next,
                    onSaved: (val) {
                      pass = val;
                    },
                    validator: (val) {
                      pass = val;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Confirm Password'),
                    ),
                    focusNode: confirmFocusNode,
                    textInputAction: TextInputAction.done,
                    onSaved: (val) {
                      confirmPass = val;
                    },
                    onFieldSubmitted: (_) {
                      onSave();
                    },
                    validator: (val) {
                      if (val != pass) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
