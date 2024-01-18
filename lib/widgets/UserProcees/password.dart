import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordResetWidget extends StatefulWidget {
  @override
  State<PasswordResetWidget> createState() => _PasswordResetWidgetState();
}

class _PasswordResetWidgetState extends State<PasswordResetWidget> {
  String _password = '';
  String _confpassword = '';
  bool _isValidEmail = false;
  bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  final url = "http://localhost:5000/auth/";

  final dio = Dio();

  void _validatePassword(String password) {
    RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    setState(() {
      _isValidEmail = passwordRegex.hasMatch(password);
    });
  }

  void setPassword() async {
    if (_formKey.currentState!.validate()) {
      final formData = {
        'email': 'spatidar7865@gmail.com',
        'password': _password,
      };
      try {
        final response =
            await dio.post(url + 'update_password', data: formData);
        if (response.statusCode == 200) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(
                    child: Text('Password Successfully Updated',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        GoRouter.of(context).go('/login'); // Close the dialog
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              });
        }
      } catch (error) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Reset password'),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _validatePassword(value);
                        _password = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password can not be empty';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else if (!_isValidEmail) {
                        return 'Password must contain at least one letter, one numeric digit, and one special character';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _confpassword = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password can not be empty';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else if (_password != _confpassword) {
                        return 'Password not Matched';
                      } else if (!_isValidEmail) {
                        return 'Password must contain at least one letter, one numeric digit, and one special character';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 800,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  this.setPassword();
                },
                child: Text('Reset Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
