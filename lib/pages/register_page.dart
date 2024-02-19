import 'package:firebase_project_1/pages/login_page.dart';
import 'package:firebase_project_1/services/auth_service.dart';
import 'package:firebase_project_1/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatefulWidget {
  static const String id = "register_page";
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisible = false;
  bool isChecked = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //! logo
              Column(
                children: [
                  Image.asset("assets/images/logo_image.png"),
                  textWidget(
                      textInput: 'LOGO',
                      textFontSize: 20,
                      textFontWeight: FontWeight.w700,
                      textColor: blueGreyColor)
                ],
              ),
              spaceWidget(direction: 1, spaceSize: 10),

              //! register tex
              SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textWidget(
                        textInput: "Register",
                        textFontWeight: FontWeight.w700,
                        textFontSize: 30),
                    textWidget(
                      textInput: "Enter your details to register",
                    ),
                  ],
                ),
              ),
              spaceWidget(direction: 1, spaceSize: 10),

              //! text fields
              SizedBox(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // name
                    TextField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(width: .5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: blueGreyColor)),
                          hintText: 'Name',
                          hintStyle:
                              TextStyle(color: blueGreyColor, fontSize: 16)),
                    ),
                    // email address
                    TextField(
                      controller: _emailAddressController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(width: .5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: blueGreyColor)),
                          hintText: 'Email Address',
                          hintStyle:
                              TextStyle(color: blueGreyColor, fontSize: 16)),
                    ),

                    // phone number
                    IntlPhoneField(
                      controller: _phoneNumberController,
                      // initialCountryCode: 'UZB',
                      decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(width: .5)),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(width: .5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: blueGreyColor)),
                          hintText: 'Mobile Number',
                          hintStyle:
                              TextStyle(color: blueGreyColor, fontSize: 16)),
                    ),

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
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(width: .5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: blueGreyColor)),
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(color: blueGreyColor, fontSize: 16)),
                    ),

                    // confirmpassword
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: isVisible,
                      controller: _confirmPasswordController,
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
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(width: .5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: blueGreyColor)),
                          hintText: 'Confirm Password',
                          hintStyle:
                              TextStyle(color: blueGreyColor, fontSize: 16)),
                    ),
                  ],
                ),
              ),
              spaceWidget(direction: 1, spaceSize: 10),
              //! agreement  register and help
              SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // agreement
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: textWidget(
                              textInput:
                                  'I agree with the terms and conditions',
                              textFontSize: 16,
                              textColor: blueGreyColor),
                        )
                      ],
                    ),

                    // register button
                    MaterialButton(
                      height: 45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      minWidth: double.infinity,
                      color: blueGreyColor,
                      onPressed: () async {
                        await AuthService.registerUser(context,
                            name: _nameController.text,
                            emailAddress: _emailAddressController.text,
                            password: _passwordController.text);
                      },
                      child: textWidget(
                          textInput: 'Register',
                          textColor: Colors.white,
                          textFontWeight: FontWeight.w700),
                    ),

                    // login
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget(
                            textInput: "Already have an account ",
                            textFontSize: 16),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, LogInPage.id);
                            },
                            child: textWidget(
                                textInput: "Login ",
                                textFontSize: 16,
                                textFontWeight: FontWeight.bold)),
                      ],
                    ),

                    // help
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textWidget(
                            textInput: "Need help? Visit our ",
                            textFontSize: 16),
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
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
