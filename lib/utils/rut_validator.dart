class RutValidator {
  static bool isValidRut(String rut) {
    // Quita los puntos y el guión
    rut = rut.replaceAll('.', '');
    rut = rut.replaceAll('-', '');

    // Verifica si el RUT es válido
    int rutLength = rut.length;
    if (rutLength < 2) {
      return false;
    }

    String verification = rut[rutLength - 1];
    String rutWithoutVerification = rut.substring(0, rutLength - 1);

    int sum = 0;
    int factor = 2;
    for (int i = rutWithoutVerification.length - 1; i >= 0; i--) {
      int digit = int.parse(rutWithoutVerification[i]);
      sum += digit * factor;
      factor = (factor == 7) ? 2 : factor + 1;
    }

    int mod = sum % 11;
    String verificationExpected;
    if (mod == 1) {
      verificationExpected = 'k';
    } else if (mod == 0) {
      verificationExpected = '0';
    } else {
      verificationExpected = (11 - mod).toString();
    }

    return verification.toLowerCase() == verificationExpected.toLowerCase();
  }

  static String formatRut(String rut) {
  int length = rut.length;
  String result = rut.substring(0, length - 1);
  result = result.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d{3})'), (Match m) => '${m[1]}.${m[2]}.${m[3]}-');
  result = result + rut.substring(length - 1);
  return result;
}

}