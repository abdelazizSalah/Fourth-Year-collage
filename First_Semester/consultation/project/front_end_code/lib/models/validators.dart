bool notEmpty(String value) {
  return value.trim().isNotEmpty;
}

isEmail(String value) {
  const emailPattern = r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,}$';

  if (RegExp(emailPattern).hasMatch(value.trim())) {
    return null;
  } else {
    return 'Invalid email address';
  }
}

signinPassword(String value) {
  if (value.trim().length >= 8) {
    return null;
  } else {
    return 'Inorrect Password!';
  }
}

isPassword(String value) {
  if (value.trim().length >= 8) {
    return null;
  } else {
    return 'very weak password\nshould be at least 8 characters';
  }
}

isPhone(String value) {
  const digitPattern = r'^\d+$';
  var onlyNumbers = RegExp(digitPattern).hasMatch(value.trim());

  // must start with 010 or 011 or 015 or 012
  bool validEgyptianPhoneNumber = value.startsWith('010') ||
      value.startsWith('011') ||
      value.startsWith('012') ||
      value.startsWith('015');

  if (value.trim().length == 11 && onlyNumbers && validEgyptianPhoneNumber) {
    return null;
  } else {
    return 'Please enter a valid phone number';
  }
}

isGrade(String value) {
  if (value.trim().length == 4) {
    return null;
  } else {
    return 'please choose grade';
  }
}

isGovernorate(String value) {
  if (value.trim().length >= 3) {
    return null;
  } else {
    return 'please choose a governorate';
  }
}

isName(String value) {
  if (value.trim().length >= 3) {
    return null;
  } else if (value.trim().length > 30) {
    return "Too long, maximum 30 characters";
  } else {
    return 'not valid.';
  }
}

isAddress(String value) {
  if (value.trim().length >= 3) {
    return null;
  } else {
    return 'enter valid address';
  }
}

isSchool(String value) {
  if (value.trim().length >= 3) {
    return null;
  } else {
    return 'enter valid school';
  }
}

validValue(String value) {
  if (value.trim().isEmpty) {
    return 'Invalid Input!';
  } else {
    return null;
  }
}

isNumberAndLessThanHundred(String number) {
  const digitPattern = r'^\d+$';
  var onlyNumbers = RegExp(digitPattern).hasMatch(number.trim());

  if (onlyNumbers) {
    return isGreaterThanHundred(number.trim());
  } else {
    return 'please insert numbers only';
  }
}

isGreaterThanHundred(String number) {
  if (int.parse(number.trim()) > 100) {
    return 'please insert number less than hundred';
  } else {
    return null;
  }
}

isNumber(String val) {
  const digitPattern = r'^\d+$';
  var onlyNumbers = RegExp(digitPattern).hasMatch(val.trim());

  if (onlyNumbers) {
    return null;
  } else {
    return 'please insert numbers only';
  }
}

validPassword(String val) {
  if (val.trim().length >= 8) {
    return null;
  } else {
    return 'Incorrect password';
  }
}

bool isValidDriveLink(String link) {
  Uri uri = Uri.parse(link);
  return uri.scheme == 'https' && uri.host == 'drive.google.com';
}
