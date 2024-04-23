import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_button.dart';
import 'package:shoes_shopping_app/core/constants/strings.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/features/sign_up/components/custom_suffix_icon.dart';
import 'package:shoes_shopping_app/features/sign_up/components/form_error.dart';
import 'package:shoes_shopping_app/features/sign_up/screens/complete_profile_screen.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email, password, confirmPassword;

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
          SizedBox(height: smallSpace),
          buildPasswordFormField(),
          SizedBox(height: smallSpace),
          buildConfirmPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: mediumSpace),
          MyButton(
            text: "Continue",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, CompleteProfileScreen.route);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        if (password == value) {
          removeError(error: Strings.matchPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: Strings.matchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(icon: Assets.iconsLock),
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
        password = value;
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
