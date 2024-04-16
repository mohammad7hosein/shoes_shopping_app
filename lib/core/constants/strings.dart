class Strings {
    static final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
   static const String emailNullError = "Please Enter your email";
   static const String invalidEmailError = "Please Enter Valid Email";
   static const String passNullError = "Please Enter your password";
   static const String shortPassError = "Password is too short";
   static const String matchPassError = "Passwords don't match";
   static const String nameNullError = "Please Enter your name";
   static const String phoneNumberNullError = "Please Enter your phone number";
   static const String addressNullError = "Please Enter your address";
}