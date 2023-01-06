mixin FieldValidations {
  /// ## UserName Validation
  /// * check null or is empty
  String? usernameValidation({required String? username}) {
    if (username == null || username.isEmpty) {
      return 'Please enter username';
    }
    final _username = username.trim();
    if (_username.length < 4) {
      return 'Username cannot be less than 4 characters';
    }
    return null;
  }

  /// ## Password Validation
  /// * check null or is empty
  /// * trim
  /// * length less than 8
  String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter Password';
    }

    final _password = password.trim();

    if (_password.length < 8) {
      return 'Please enter password greater than 8 characters';
    }

    return null;
  }
}
