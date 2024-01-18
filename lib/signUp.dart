import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passwordVisible = true;
  bool onRegistration = false;
  bool _isValidEmail = false;
  String _name = '';
  String _email = '';
  String _password = '';
  String _confpassword = '';

  final url = "http://localhost:5000/auth/";
  final _formKey = GlobalKey<FormState>();
  final dio = Dio();
  void _validatePassword(String password) {
    RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    setState(() {
      _isValidEmail = passwordRegex.hasMatch(password);
    });
  }

  formValidation(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final formData = {
        'name': _name,
        'email': _email,
        'password': _password,
      };
      try {
        final response = await dio.post(url + 'registration', data: formData);
        print(response);
        if (response.statusCode == 200) {
          print('POST request successful!');
          setState(() {
            onRegistration = true;
          });
            await Future.delayed(const Duration(seconds: 1));
            GoRouter.of(context).go('/login');
          
        } else {
          print(
              'Failed to make POST request. Status code: ${response.statusCode}');
        }
      } catch (error) {
        print('Error posting data: $error');
      }
      // getTokenWithRegistration(formData);
    }
  }

  void getTokenWithRegistration(formData) async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
              const Column(
                children: [
                  Text("Registration! ",
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your name',
                          labelText: 'Name',
                        ),
                        onChanged: (value) {
                          setState(() => {_name = value});
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name can not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          labelText: 'Email',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!value.contains('@')) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          labelText: 'Password',
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
                            _password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can not be empty';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }else if (!_isValidEmail) {
                            return 'Password must contain at least one letter, one numeric digit, and one special character';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: passwordVisible,
                        decoration: const InputDecoration(
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _validatePassword(value);
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
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          formValidation(context);
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.purple,
                          ),
                          width: 100,
                          alignment: Alignment.center,
                          height: 50,
                          child: onRegistration
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 24.0,
                                )
                              : const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: new Text(
                                'Login ',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 10),
                              ),
                            ),
                            onTap: () => {GoRouter.of(context).go('/login')}),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
