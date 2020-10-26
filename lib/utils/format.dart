import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Format {

  static String currency = '₱';

  static String getPrice(double price) => '$currency$price';

  static TimeOfDay getTimeOfDay(String time) => TimeOfDay.fromDateTime(DateFormat.jm().parse(time));
}