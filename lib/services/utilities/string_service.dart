/*
FUNCTION:
DESCRIPTION: Service to handle any string manipulation or validation
PARAMETERS: input - string
 */


String EmailFormValidator(String email){
  if(email.isValidEmail()){
    return null;
  } else{
    return "Please enter a valid email";
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool containsUpperCase() {
    return RegExp(r'(?=.*[A-Z])').hasMatch(this);
  }

  bool containsLowerCase() {
    return RegExp(r'(?=.*[a-z])').hasMatch(this);
  }

  bool containsNumber() {
    return RegExp(r'(?=.*?[0-9])').hasMatch(this);
  }

  bool containsSpecialCharacter() {
    return RegExp(r'(?=.*?[!@#\$&*~]).{8,}').hasMatch(this);
  }
}

//EMAIL VALIDATION
String emailValidator(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Email format is invalid';
  } else {
    return null;
  }
}

//PASSWORD VALIDATION
String pwdValidator(String value) {
  if (value.isEmpty) {
    return 'Enter Password';
  }else  if (value.length < 6) {
    return 'Password needs to have character, an uppercase, lowercase, 1 number';
  }else {
    return null;
  }
}
//PASSWORD VALIDATION
String confirmPwdValidator(String value) {
  if (value.isEmpty) {
    return 'Retype your password';
  }/*else if (value!=model.txtPassword.text) {
      return 'Both password should be match';
    }*/ else {
    return null;
  }
}
//PASSWORD VALIDATION
String pwdMatchValidator(String value) {
  if (value.isEmpty) {
    return 'Both password should be match';
  } else {
    return null;
  }
}

//Name VALIDATION
String nameValidator(String value) {
  if (value.isEmpty) {
    return 'Enter name';
  } else {
    return null;
  }
}