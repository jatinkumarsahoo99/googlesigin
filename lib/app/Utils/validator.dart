class Validator {
  static bool isEmailValid(String email) {
    // Regular expression pattern for email validation
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Check if the email matches the pattern
    return emailRegExp.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    // Minimum length check
    if (password.length < 8) {
      return false;
    }

    // Special character check
    RegExp specialCharRegExp = RegExp(r'[@_!#$%^&*()<>?/\|}{~:]');
    if (!specialCharRegExp.hasMatch(password)) {
      return false;
    }

    // Capital letter check
    RegExp capitalLetterRegExp = RegExp(r'[A-Z]');
    if (!capitalLetterRegExp.hasMatch(password)) {
      return false;
    }

    // Numeric character check
    RegExp numericRegExp = RegExp(r'[0-9]');
    if (!numericRegExp.hasMatch(password)) {
      return false;
    }

    // If all criteria pass, return true
    return true;
  }

}
