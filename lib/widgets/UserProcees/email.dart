import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailInputWidget extends StatefulWidget {
  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  String _email = '';
  final url = "http://localhost:5000/auth/";
  final dio = Dio();

   void sentOtpOnMail() async{
     final formData = {
      'email': _email,
    };
   try {
      final response = await dio.post(url + 'send_otp', data: formData);
      if (response.statusCode == 200) {
        GoRouter.of(context).go('/otp');
      } 
    } catch (error) {
     showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('OTP Send Failed',style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )),
        content: Text('Email is not registered with torus. Please registered first'),
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
            GoRouter.of(context).pop();
          },
        )),
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forget Password !',
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Enter your registered email address with torus',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Email Address',
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
                        } else if (!value.contains('@')) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: 800,
                  height: 40,
                  child: ElevatedButton(
                    child: const Text('Send OTP'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      this.sentOtpOnMail();
                    },
                  ),
                )
              ],
            )));
  }
}
