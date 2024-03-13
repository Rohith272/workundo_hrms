import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workundo_hrms/utils/images.dart';
import 'package:workundo_hrms/views/widgets/custom_text_field.dart';
import '../../../../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? name;
  bool? rememberMe = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 395,
            child: Column(
              children: [
                const Text(
                  "worksync",
                  style: TextStyle(
                      fontFamily: 'Syncopate',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      decoration: TextDecoration.none
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.only(top: 24),
                  height: 340,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.64),
                      border: Border.all(
                          color: loginBorderGrey,
                          width: 1
                      ),
                    color: textFieldBlack
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 39,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width *0.7,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: loginBorderGrey,
                              width: 1,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: 'Clash',
                              fontSize: 12.42,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              decoration: TextDecoration.none
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 23.55),
                        child: const Text(
                          "Username",
                          style: TextStyle(
                              fontFamily: 'Clash',
                              fontSize: 12.42,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              decoration: TextDecoration.none
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 13, right: 13,top: 5),
                        child: CustomTextField(
                          textEditingController: usernameController,
                          focusNode: _focusNode,
                          hintText: '',
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          "Password",
                          style: TextStyle(
                              fontFamily: 'Clash',
                              fontSize: 12.42,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              decoration: TextDecoration.none
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 13, right: 13,top: 5),
                        child: CustomTextField(
                          textEditingController: passwordController,
                          focusNode: _focusNode,
                          hintText: '',
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio<bool>(
                              toggleable: true,
                              value: true,
                              activeColor: Colors.black,
                              fillColor: MaterialStateProperty.all(Colors.white),
                              groupValue: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value;
                                });
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                  fontFamily: 'Clash',
                                  fontSize: 12.42,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8.75),
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: loginBorderGrey,
                                width: 1
                            ),
                            color: Colors.black
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'Clash',
                            fontSize: 12.42,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}