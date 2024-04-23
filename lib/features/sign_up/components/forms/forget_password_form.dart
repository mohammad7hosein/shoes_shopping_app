import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_button.dart';
import 'package:shoes_shopping_app/core/constants/strings.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/features/sign_up/components/custom_suffix_icon.dart';
import 'package:shoes_shopping_app/features/sign_up/components/form_error.dart';
import 'package:shoes_shopping_app/features/sign_up/components/no_account_text.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(Strings.emailNullError)) {
                setState(() {
                  errors.remove(Strings.emailNullError);
                });
              } else if (Strings.emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(Strings.invalidEmailError)) {
                setState(() {
                  errors.remove(Strings.invalidEmailError);
                });
              }
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(Strings.emailNullError)) {
                setState(() {
                  errors.add(Strings.emailNullError);
                });
              } else if (value.isNotEmpty &&
                  !Strings.emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(Strings.invalidEmailError)) {
                setState(() {
                  errors.add(Strings.invalidEmailError);
                });
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(icon: Assets.iconsMail),
            ),
          ),
          SizedBox(height: smallSpace),
          FormError(errors: errors),
          SizedBox(height: largeSpace),
          MyButton(
            text: "Continue",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          ),
          SizedBox(height: largeSpace),
          const NoAccountText(),
        ],
      ),
    );
  }
}
