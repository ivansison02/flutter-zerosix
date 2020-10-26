class Format {

  static String currency = '₱';

  static String getPrice(double price) => '$currency$price';
}