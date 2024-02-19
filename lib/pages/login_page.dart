import 'package:firebase_project_1/pages/register_page.dart';
import 'package:flutter/material.dart';

import '../widgets/all_widgets.dart';

class LogInPage extends StatefulWidget {
  static const String id = "log_in_page";
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isVisible = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //! kirish
            Image(image: AssetImage('assets/images/logo_image.png')),
            textWidget(textInput: 'Logo'),

            //! login text
            textWidget(
                textInput: 'Login',
                textFontWeight: FontWeight.w700,
                textFontSize: 30,
                textColor: const Color.fromRGBO(69, 75, 96, 1)),

            textWidget(
              textColor: const Color.fromRGBO(69, 75, 96, 1),
              textAlign: TextAlign.center,
              textFontSize: 16,
              textInput: '''
        Enter your username and password 
        to login
              ''',
            ),

            //!text fields

            // email
            TextField(
              keyboardType: TextInputType.name,
              controller: _emailController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(width: .5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: blueGreyColor)),
                  hintText: 'example@gmail.com',
                  hintStyle: TextStyle(color: blueGreyColor, fontSize: 16)),
            ),
            forgotText(ifPasswordEnterTrueElseNo: true),

            // password
            TextField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: isVisible,
              controller: _passwordController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: iconWidget(
                          inputIcon: isVisible
                              ? Icons.visibility
                              : Icons.visibility_off)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(width: .5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: blueGreyColor)),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: blueGreyColor, fontSize: 16)),
            ),
            forgotText(ifPasswordEnterTrueElseNo: false),

            //!login and login with buttons
            Column(
              children: [
                // login
                MaterialButton(
                  height: 45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minWidth: double.infinity,
                  color: blueGreyColor,
                  onPressed: () {},
                  child: textWidget(
                      textInput: 'Login',
                      textColor: Colors.white,
                      textFontWeight: FontWeight.w700),
                ),
                spaceWidget(direction: 1, spaceSize: 10),
                // text
                textWidget(
                    textInput: 'Or login in with',
                    textFontSize: 16,
                    textColor: blueGreyColor),
                spaceWidget(direction: 1, spaceSize: 10),
                // google facebook
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        minWidth: double.infinity,
                        color: Colors.white,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/google.png",
                              width: 20,
                            ),
                            textWidget(
                                textInput: 'Google',
                                textColor: blueGreyColor,
                                textFontWeight: FontWeight.w700),
                          ],
                        ),
                      ),
                    ),
                    spaceWidget(direction: 0, spaceSize: 10),
                    Expanded(
                      child: MaterialButton(
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        minWidth: double.infinity,
                        color: blueGreyColor,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/facebook.png",
                              width: 22,
                            ),
                            textWidget(
                                textInput: 'Facebook',
                                textColor: Colors.white,
                                textFontWeight: FontWeight.w700),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            //! not registered yet text button
            Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(
                          textInput: "Don't have an account? ",
                          textFontSize: 16),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RegisterPage.id);
                          },
                          child: textWidget(
                              textInput: "Register ",
                              textFontSize: 16,
                              textFontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget(
                          textInput: "Need help? Visit our ", textFontSize: 16),
                      GestureDetector(
                        onTap: () {},
                        child: textWidget(
                            textInput: "help center",
                            textFontSize: 16,
                            textFontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget forgotText({required bool ifPasswordEnterTrueElseNo}) {
    return Align(
      alignment: Alignment.topRight,
      child: ifPasswordEnterTrueElseNo
          ? TextButton(
              onPressed: () {},
              child: textWidget(
                  textColor: blueGreyColor,
                  textInput: 'Forgot Email Address?',
                  textFontSize: 16))
          : TextButton(
              onPressed: () {},
              child: textWidget(
                  textInput: 'Forgot Password?',
                  textColor: blueGreyColor,
                  textFontSize: 16)),
    );
  }
}
