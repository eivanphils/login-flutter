class EmailValidator {
  static bool isValid(String value) {
    if (value.isEmpty) {
      return false;
    }
    // Expresión regular para validar el formato de correo electrónico
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }
}