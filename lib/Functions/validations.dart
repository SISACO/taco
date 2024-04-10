
String? validateName(String?value){
  if (value == null || value.isEmpty) {
      return 'Name is Required';
    }
    return null;
}

String? validateUsern(String? value){
    if (value == null || value.isEmpty) {
      return 'Username is Required';
    }
    return null;
}


String? validateEmail(String ?value){
  if (value == null || value.isEmpty) {
      return 'Email is Required';
    }

    String pattern = r'\w+@\w+\.\w+';
    RegExp reg = RegExp(pattern);

  if(!reg.hasMatch(value)) return 'Invaild Email';

    return null;
}

String? validatePass(String? value){
    if (value == null || value.isEmpty) {
      return 'Password is Required';
    }
    
   bool hasMinLength = value.length > 7;

    if(!hasMinLength) return 'password must have atleast 8 characters';

    return null;
}