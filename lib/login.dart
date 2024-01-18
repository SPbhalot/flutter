// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unnecessary_set_literal, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/routing/routers.dart';
import 'package:practice/secure_Store/secureStorage.dart';
import 'package:dio/dio.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: non_constant_identifier_names
  final url = "http://localhost:5000/auth/";
  String _email = '';
  String _password = '';

  bool passwordVisible = true;
  bool onContainer = false;
  final dio = Dio();
  final TextEditingController token_id = TextEditingController();

  final SecureStorage _secureStorage = SecureStorage();

  final _formKey = GlobalKey<FormState>();

  Future<void> fetchSecureStorageData() async {
    token_id.text = await _secureStorage.getToken() ?? '';
  }


  void getLogin() async {
    final formData = {
      'email': _email,
      'password': _password,
    };
    try {
      final response = await dio.post(url + 'login', data: formData);
      if (response.statusCode == 200) {
        print('POST request successful!');
        print(response);
        String Token_id = response.data?['Token'];
        _secureStorage.setToken(Token_id);
        setState(() {
          onContainer = true;
        });
        await Future.delayed(Duration(seconds: 1));
        GoRouter.of(context).go(MyAppRouteConstants.dashboard);
      } 
    } catch (error) {
     showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Login Failed',style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )),
        content: Text('Incorrect email or password. Please try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    }
     );
        // alertService(title: 'Login Faild', subTitle: 'User credential wrong');
        // print(
        //     'Failed to make POST request. Status code');
      
    }
    
  }

  formValidation(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      getLogin();
    }
  }

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
              Column(
                children: [
                  Text("Well Come Back ! ",
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
                      SizedBox(
                      
                        child: TextFormField(
                          
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your email',
                            labelText: 'Email',
                          ),
                          onChanged: (value) {
                            setState(() => {
                                  _email = value.toString(),
                                  //  SecureStorage.setUserName(value.toString())
                                });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'email can not be empty';
                            }else if (!value.contains('@')) {
                              return 'Invalid email format';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        
                        child: TextFormField(
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
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
                            setState(() => {
                                  _password = value.toString(),
                                });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password can not be empty';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  formValidation(context);
                },
                child:Center(
                  child:MouseRegion(
                child: AnimatedContainer(
                  
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(onContainer ? 150 : 5),
                    color: Colors.purple,
                    
                  ),
                  width: onContainer ? 50 : 100,
                  alignment: Alignment.center,
                  height: 50,
                  child: onContainer
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 24.0,
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                ),
                cursor: SystemMouseCursors.click,
                  )
                )
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: new Text(
                        'Dose not have Account ?',
                        style: TextStyle(color: Colors.blueAccent, fontSize: 10),
                      ),
                    ),
                    onTap: () => {GoRouter.of(context).go(MyAppRouteConstants.registration)}),
              ),
              SizedBox(
                width: 5,
              ),
              Center(
                child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: new Text(
                        'Forget Password ?',
                        style: TextStyle(color: Colors.redAccent, fontSize: 10),
                      ),
                    ),
                    onTap: () => {GoRouter.of(context).go('/email')}),
              ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
