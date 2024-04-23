import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_button.dart';
import 'package:shoes_shopping_app/core/constants/strings.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/sign_up/components/custom_suffix_icon.dart';
import 'package:shoes_shopping_app/features/sign_up/components/form_error.dart';
import 'package:shoes_shopping_app/features/sign_up/screens/login_success_screen.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

import '../../screens/forget_password_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email, password;
  bool remember = false;

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          const SizedBox(height: 30),
          buildPasswordFormField(),
          const SizedBox(height: 30),
          FormError(errors: errors),
          const SizedBox(height: 30),
          Row(
            children: [
              Checkbox(
                activeColor: context.scheme.primary,
                side: BorderSide(color: context.scheme.onBackground),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, ForgetPasswordScreen.route),
                child: const Text(
                  "Forget Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          MyButton(
            text: "Continue",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, LoginSuccessScreen.route);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Strings.passNullError);
        } else if (value.length >= 8) {
          removeError(error: Strings.shortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Strings.passNullError);
          return "";
        } else if (value.isNotEmpty && value.length < 8) {
          addError(error: Strings.shortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(icon: Assets.iconsLock),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Strings.emailNullError);
        } else if (Strings.emailValidatorRegExp.hasMatch(value)) {
          removeError(error: Strings.invalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Strings.emailNullError);
          return "";
        } else if (value.isNotEmpty &&
            !Strings.emailValidatorRegExp.hasMatch(value)) {
          addError(error: Strings.invalidEmailError);
          return "";
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
    );
  }
}
