import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OtpInputWidget extends StatefulWidget {
  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  late String _otp = '';
  final url = "http://localhost:5000/auth/";
  final dio = Dio();
  late List<TextEditingController> _otpControllers;
  late List<FocusNode> _focusNodes;
  final _formKey = GlobalKey<FormState>();
  late Timer _timer;
  int _timerCount = 120;

  void _checkOTP() async {
    if (_formKey.currentState!.validate()) {
      try {
        final formData = {
          'otp': _otp,
        };
        final response = await dio.post(url + 'verifyOtp', data: formData);
        if (response.statusCode == 200) {
          GoRouter.of(context).go('/password_reset');
        }
      } catch (error) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('OTP is invalid',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                content: Text('Please check the OTP'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(6, (index) => TextEditingController());
    _focusNodes = List.generate(6, (index) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerCount > 0) {
          _timerCount--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _resendOTP() {
    setState(() {
      _timerCount = 120;
    });
    _startTimer();
  }

  void _onOTPDigitEntered(String value, int index) {
    if (value.isNotEmpty) {
      setState(() {
        _otp = _otp + value;
      });
      if (index < 6) {
        FocusScope.of(context).nextFocus();
      }
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter the OTP sent on your registered email'),
                SizedBox(height: 16.0),
                Form(
                  key: _formKey,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 6; i++)
                              SizedBox(
                                width: 40,
                                child: TextField(
                                  controller: _otpControllers[i],
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    _onOTPDigitEntered(value, i);
                                  },
                                  autofocus: i == 0,
                                  focusNode: _focusNodes[i],
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    counterText: '',
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Resend OTP in $_timerCount seconds'),
                                TextButton(
                                  onPressed:
                                      _timerCount == 0 ? _resendOTP : null,
                                  child: const Text('Resend OTP'),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 800,
                              height: 40,
                              child: ElevatedButton(
                                child: const Text('Verify OTP'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  _checkOTP();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
