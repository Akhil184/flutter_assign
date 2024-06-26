import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../http_calls/api_call.dart';
import 'individual_meeting_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _passwordValid = false;
  bool _emailTouched = false;
  bool _emailValid = false; // State to track email format validity

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title:Align(
        alignment: Alignment.center,
        child:Text('promilo', style: TextStyle(fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold),textAlign:TextAlign.center,),
        ),// Replace with your preferred title
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.01, vertical: screenHeight * 0.02),
            width: screenWidth * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Hi, Welcome Back!',
                  style: TextStyle(
                    fontSize:14.sp,
                    fontWeight: FontWeight.bold,
                    color:Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.01, bottom: 5),
                  child: Text(
                    'Please Sign in to continue',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.bold,
                      color:Colors.black
                    ),
                  ),
                ),
                TextField(
                  controller: _emailController,
                  style: TextStyle(fontSize: screenHeight * 0.02,color:Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter Email or Mob No.',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    errorText: _emailTouched && !_emailValid
                        ? 'Enter a valid email'
                        : null,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _emailTouched = true;
                      _emailValid = _isValidEmail(value);
                    });
                  },
                ),
                SizedBox(height:3),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle sign in with OTP instead
                    },
                    child: Text(
                      'Sign In with OTP',
                      style: TextStyle(
                          color: Colors.blue[900], fontSize: 13.sp),

                    ),
                  ),
                ),
                SizedBox(height:5),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.01,bottom:screenHeight*0.01),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: screenHeight * 0.02,
                      fontWeight: FontWeight.bold,
                      color:Colors.black
                    ),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  style: TextStyle(fontSize: screenHeight * 0.02,color:Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _passwordValid = value.isNotEmpty;
                    });
                  },
                ),
                SizedBox(height:3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        Text('Remember me', style: TextStyle(fontSize: 13.sp,color:Colors.black)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.blue[900], fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: _emailValid && _passwordValid ? _submit : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, disabledForegroundColor: Colors.grey.withOpacity(0.38), disabledBackgroundColor: Colors.grey[400], backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, screenHeight * 0.06),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.blue),

                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: screenHeight * 0.02,color:Colors.white),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or',
                        style: TextStyle(fontSize: screenHeight * 0.02,color:Colors.black),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle Google login
                      },
                      child: Image.asset(
                        'assets/google_icon.png',
                        width: screenHeight * 0.04,
                        height: screenHeight * 0.04,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    GestureDetector(
                      onTap: () {
                        // Handle LinkedIn login
                      },
                      child: Image.asset(
                        'assets/linkdin.png',
                        width: screenHeight * 0.05,
                        height: screenHeight * 0.05,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    GestureDetector(
                      onTap: () {
                        // Handle Facebook login
                      },
                      child: Image.asset(
                        'assets/facebook-icon.png',
                        width: screenHeight * 0.043,
                        height: screenHeight * 0.043,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    GestureDetector(
                      onTap: () {
                        // Handle Instagram login
                      },
                      child: Image.asset(
                        'assets/instagram.png',
                        width: screenHeight * 0.054,
                        height: screenHeight * 0.054,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    GestureDetector(
                      onTap: () {
                        // Handle WhatsApp login
                      },
                      child: Image.asset(
                        'assets/whatspp.png',
                        width: screenHeight * 0.07,
                        height: screenHeight * 0.07,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Business User?',
                            style: TextStyle(fontSize: 13.sp,color:Colors.black),
                          ),
                          SizedBox(height: 8), // Adjust spacing as needed
                          Text(
                              'Login Here',
                              style: TextStyle(
                                  color: Colors.blue[900], fontSize: 13.sp),
                            ),
                        ],
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(fontSize: 13.sp,color:Colors.black),
                          ),
                          SizedBox(height: 8), // Adjust spacing as needed
                           Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.blue[900], fontSize: 13.sp),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.03),
                Center(
                  child:Text.rich(
                    TextSpan(
                      text: 'By continuing, you agree to\n',
                      style: TextStyle(
                        fontSize: 16.0,
                        color:Colors.black,
                      ),
                      children: <TextSpan>[
                    TextSpan(
                    text: 'Promilo'"'s",
                      style: TextStyle(
                        color:Colors.black
                      ),
                    ),
                        TextSpan(
                          text: ' Terms of Use & Privacy Policy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Colors.black
                          ),
                        ),
                    ],
                  ),
                    textAlign: TextAlign.center,
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  void _submit() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Validate email and password again (in case state has changed since build)
    bool validEmail = _isValidEmail(email);
    bool validPassword = password.isNotEmpty;

    if (validEmail && validPassword) {
      // Call your API service
      bool loginSuccess = await ApiService.loginUser(email, password);

      if (loginSuccess) {
        // Navigate to the next page on successful login
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MeetingPage()));
      } else {
        // Show error message or handle login failure
        _showLoginErrorDialog();
      }
    }
  }

  void _showLoginErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Failed',style:TextStyle(color:Colors.black),),
          content: Text('Invalid email or password. Please try again.',style:TextStyle(color:Colors.black),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
