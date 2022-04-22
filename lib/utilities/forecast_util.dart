import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE,MMM d,y').format(dateTime);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.white,
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          '$value',
          style: TextStyle(color: Colors.white54, fontSize: 18),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          '$units',
          style: TextStyle(color: Colors.white54, fontSize: 18),
        ),
      ],
    );
  }
}
