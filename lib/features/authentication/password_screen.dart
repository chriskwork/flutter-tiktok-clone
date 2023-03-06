// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    // if (_password.isEmpty) return null;

    // final regExp = RegExp(
    //     // 8자 이상, 알파벳&넘버, 최소 1개 특수문자 포함
    //     r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{9,}$");

    // if (!regExp.hasMatch(_password)) {
    //   return "password is not valid";
    // } else {
    //   return null;
    // }

    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          title: const Text(
            "Sign up",
          ),
        ),
        // ignore: prefer_const_constructors
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
            vertical: Sizes.size24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Password?",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                onEditingComplete: _onSubmit,
                autocorrect: false,
                obscureText: _obscureText,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          size: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: Colors.grey.shade500,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Password",
                  errorText: "Password is not valid",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Gaps.v10,
              const Text(
                "Your password must have:",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Column(
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: 12,
                        color: _isPasswordValid()
                            ? Colors.green
                            : Colors.grey.shade400,
                      ),
                      Gaps.h4,
                      Text(
                        "More than 8 characters",
                        style: TextStyle(
                          color: _isPasswordValid()
                              ? Colors.black54
                              : Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: 12,
                        color: _isPasswordValid()
                            ? Colors.green
                            : Colors.grey.shade400,
                      ),
                      Gaps.h4,
                      Text(
                        "At least one special letter",
                        style: TextStyle(
                          color: _isPasswordValid()
                              ? Colors.black54
                              : Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
