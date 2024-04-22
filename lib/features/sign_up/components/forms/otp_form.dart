import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_button.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_bottom_navigation.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/features/sign_up/components/otp_field.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpField(
                onChanged: (value) =>
                    nextField(value: value, focusNode: pin2FocusNode),
              ),
              OtpField(
                focusNode: pin2FocusNode,
                onChanged: (value) =>
                    nextField(value: value, focusNode: pin3FocusNode),
              ),
              OtpField(
                focusNode: pin3FocusNode,
                onChanged: (value) =>
                    nextField(value: value, focusNode: pin4FocusNode),
              ),
              OtpField(
                focusNode: pin4FocusNode,
                onChanged: (value) => pin4FocusNode.unfocus(),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          MyButton(
            text: "Continue",
            onPressed: () {
              Navigator.pushNamed(context, MyBottomNavigation.route);
            },
          )
        ],
      ),
    );
  }
}
