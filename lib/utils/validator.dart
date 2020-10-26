class Validator {

  static bool isValidUsername(String username) => username.isNotEmpty;
  static bool isValidPassword(String password) => password.isNotEmpty;
  static bool isValidName(String name) => name.isNotEmpty;
  static bool isValidDescription(String description) => description.isNotEmpty;
  static bool isValidQty(String qty) => qty.isNotEmpty;
  static bool isValidPrice(String price) => price.isNotEmpty;
  static bool isValidTime(String time) => time.isNotEmpty;
}