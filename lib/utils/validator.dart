String? nameValidator(value) {
  RegExp regex = RegExp(r'^.{3,}$');
  if (value!.isEmpty) {
    return ("Please enter name");
  }
  if (!regex.hasMatch(value.toString())) {
    return ("Enter Valid name(Min. 3 Character)");
  }
  return null;
}

String? titleValidator(value) {
  RegExp regex = RegExp(r'^.{8,}$');
  if (value!.isEmpty) {
    return ("Please enter title");
  }
  if (!regex.hasMatch(value)) {
    return ("Enter Valid title (Min. 8 Character)");
  }
  return null;
}

String? passwordValidator(value) {
  RegExp regex = RegExp(r'^.{6,}$');
  if (value!.isEmpty) {
    return ("Password is required for login");
  }
  if (!regex.hasMatch(value)) {
    return ("Enter Valid Password(Min. 6 Character)");
  }
  return null;
}

String? emailValidator(value) {
  if (value!.isEmpty) {
    return ("Please Enter Your Email");
  }
  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
    return ("Please Enter a valid email");
  }
  return null;
}

String? phoneNumberValidator(value) {
  RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  if (value!.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String? addressValidator(value) {
  if(value!.length == 0){
    return 'Please enter address';
  }else{
    return  null;
  }
}