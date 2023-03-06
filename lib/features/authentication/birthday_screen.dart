import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime today = DateTime.now();
  late DateTime initialDate = DateTime(today.year - 12, today.month, today.day);

  @override
  void initState() {
    super.initState();

    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "When is your birthday?",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              controller: _birthdayController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
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
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              // stateful 위젯 안에 있으면 () => _onNextTap(context) 이렇게 할 필요가 없다.
              child: const FormButton(disabled: false),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 300,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          maximumDate: initialDate,
          initialDateTime: initialDate,
          onDateTimeChanged: _setTextFieldDate,
        ),
      ),
    );
  }
}
