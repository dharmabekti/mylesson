class Validation {
  check(String? validate) {
    if (validate == 'required') {
      validateRequired(validate!);
    } else if (validate == 'valid_email') {
      validateEmail(validate!);
    } else if (validate == 'required_email') {
      validateRequiredEmail(validate!);
    } else if (validate == 'valid_password') {
      validatePassword(validate!);
    } else if (validate == 'valid_year') {
      validateTahun(validate!);
    }
  }

  String? validateRequired(String value) {
    if (value.isEmpty) {
      return "Wajib Diisi";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty || !value.contains("@")) {
      return "Email Tidak Valid";
    }
    return null;
  }

  String? validateRequiredEmail(String value) {
    if ((value.isNotEmpty && value != "-") && !value.contains("@")) {
      return "Email Tidak Valid";
    }
    return null;
  }

  // Unknown
  String? validatePassword(String value) {
    if (value.isNotEmpty && value.length < 6) {
      return "Password Minimal 6 Karakter";
    }
    return null;
  }

  String? validateTahun(String value) {
    if (value.isNotEmpty && value.length != 4) {
      return "Tahun tidak sesuai";
    }
    return null;
  }
}
