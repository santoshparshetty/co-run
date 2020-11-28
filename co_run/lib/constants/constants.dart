

class MyConstant {
  static duration(int seconds) {
    Duration d = Duration(seconds: seconds);
    return d;
  }
  static String get loginPage => 'Dont have an account';
  static String get countryPhoneCode => '+91';
  static String get loginAppBarTitle => 'Login';
  static String get validPhone => 'Please enter a valid 10 digit phone number';
  static String get autoDetect => 'Please wait while we auto detect the OTP';
  static String get ok => 'OK';
  static String get internet =>
      'Please make sure your device has an internet connection and enter a valid phone number';
  static String get retry => 'Retry';
  static String failure(String phone) {
    return "Verification timeout. Make sure the number $phone is in your device.";
  }
}

