import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nosql_store/utilities//font_sizes.dart';

abstract class Styles {
  static const black100 = Colors.black;
  static const darkGrayColor = Colors.grey;
  static const primaryColor = Colors.green;
  static const warningColor = Colors.red;
  static const primaryLightColor = Colors.grey;

  static var whiteTextwithf12 = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.normal,
      fontSize: FontSizes.FONT_12);
  static var whiteTextwithopacity75f12 = TextStyle(
      color: Color(0xffffffff).withOpacity(0.75),
      fontWeight: FontWeight.normal,
      fontSize: FontSizes.FONT_12);
  static var whiteTextwithf14 = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.normal,
      fontSize: FontSizes.FONT_14);
  static var whiteTextwithf16 = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.normal,
      fontSize: FontSizes.FONT_16);
  static var whiteTextwithf18 = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.normal,
      fontSize: FontSizes.FONT_18);
  static var whiteTextwithf20 = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.normal,
      fontSize: FontSizes.FONT_20);
  static var whiteTextwithf20w6 = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.FONT_20);
  static var whiteTextwithf22 = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.normal,
      fontSize: FontSizes.FONT_22);
  static var whiteTextwithf22w6 = TextStyle(
      color: Color(0xffffffff),
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.FONT_22);

  static var blackTextwithf10 = TextStyle(
      color: black100,
      fontWeight: FontWeight.w400,
      fontSize: FontSizes.FONT_10);
  static var blackTextwithf12 = TextStyle(
    color: black100,
    fontWeight: FontWeight.w400,
    fontSize: FontSizes.FONT_12,
  );
  static var blackTextwithf13 = TextStyle(
      color: black100,
      fontWeight: FontWeight.w400,
      fontSize: FontSizes.FONT_13);
  static var blackTextwithf14 = TextStyle(
      color: black100,
      fontWeight: FontWeight.w400,
      fontSize: FontSizes.FONT_14);
  static var blackTextwithf14W600 = TextStyle(
      color: black100,
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.FONT_14);
  static var blackTextwithf16 = TextStyle(
      color: black100,
      fontWeight: FontWeight.w400,
      fontSize: FontSizes.FONT_16);
  static var blackTextwithf16w6 = TextStyle(
      color: black100,
      fontWeight: FontWeight.w600,
      fontSize: FontSizes.FONT_16);

  static var grayTextwithf11 = TextStyle(
      color: darkGrayColor,
      fontWeight: FontWeight.w400,
      fontSize: FontSizes.FONT_11);
  static var grayTextwithf12 = TextStyle(
      color: darkGrayColor,
      fontWeight: FontWeight.w400,
      fontSize: FontSizes.FONT_12);
  static var grayTextwithf13 = TextStyle(
      color: darkGrayColor,
      fontWeight: FontWeight.w400,
      fontSize: FontSizes.FONT_13);
  static var grayTextwithf13W700 = TextStyle(
      color: darkGrayColor,
      fontWeight: FontWeight.w700,
      fontSize: FontSizes.FONT_13);
  static var grayTextwithf20 = TextStyle(
      color: darkGrayColor,
      fontWeight: FontWeight.w500,
      fontSize: FontSizes.FONT_20);

  static var btnShape = RoundedRectangleBorder(
      side: BorderSide(color: Color(0xff41BFA8)),
      borderRadius: BorderRadius.all(Radius.circular(7.0)));
  static var btnShapeGray = RoundedRectangleBorder(
      side: BorderSide(color: darkGrayColor),
      borderRadius: BorderRadius.all(Radius.circular(8.0)));
  static var greentextStyle = TextStyle(
    fontSize: FontSizes.FONT_16,
    color: primaryColor,
    fontWeight: FontWeight.w500,
  );

  static InputDecoration textFieldStyle(
      {String labelTextStr = "",
      String hintTextStr = "",
      TextEditingController controller,
      bool isFocus,
      bool isSearch = false}) {
    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      labelText: labelTextStr,
      labelStyle: TextStyle(
        fontSize: FontSizes.FONT_13,
        color: darkGrayColor,
      ),
      //Add th Hint text here.
      hintText: hintTextStr,
      hintStyle: TextStyle(
        fontSize: FontSizes.FONT_13,
        color: darkGrayColor,
      ),
      errorStyle: TextStyle(fontSize: FontSizes.FONT_13, color: warningColor),
      //UnderlineInputBorder || OutlineInputBorder
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red, width: 1.0)),
      prefixIcon: isSearch ? Icon(Icons.search) : null,
      suffixIcon: isFocus
          ? IconButton(
              icon: Icon(
                Icons.clear,
              ),
              onPressed: () {
                controller.text = "";
              },
            )
          : null,
    );
  }

  static InputDecoration textFieldDropDownStyle(
      {String labelTextStr = "",
      String hintTextStr = "",
      TextEditingController controller,
      bool isFocus}) {
    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      labelText: labelTextStr,
      labelStyle: TextStyle(
        fontSize: FontSizes.FONT_13,
        color: darkGrayColor,
      ),
      //Add th Hint text here.
      hintText: hintTextStr,
      hintStyle: TextStyle(
        fontSize: FontSizes.FONT_13,
        color: darkGrayColor,
      ),
      errorStyle: TextStyle(fontSize: FontSizes.FONT_13, color: warningColor),
      //UnderlineInputBorder || OutlineInputBorder
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red, width: 1.0)),
      suffixIcon: Icon(
        Icons.arrow_drop_down,
      ),
    );
  }

  static InputDecoration dropdownFieldStyle({
    String labelTextStr = "",
    String hintTextStr = "",
  }) {
    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
      labelText: labelTextStr,
      labelStyle: TextStyle(
        fontSize: FontSizes.FONT_13,
        color: darkGrayColor,
      ),
      errorStyle: TextStyle(fontSize: 1.0, color: warningColor),
      //UnderlineInputBorder || OutlineInputBorder
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red, width: 1.0)),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: successColor, width: 1.0),
      // ),
    );
  }

  static InputDecoration dateTextFieldStyle({
    String labelTextStr = "",
    String hintTextStr = "",
    TextEditingController controller,
  }) {
    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      labelText: labelTextStr,
      labelStyle: TextStyle(
        fontSize: FontSizes.FONT_13,
        color: darkGrayColor,
      ),
      //Add th Hint text here.
      hintText: hintTextStr,
      hintStyle: TextStyle(
        fontSize: FontSizes.FONT_13,
        color: darkGrayColor,
      ),
      errorStyle: TextStyle(fontSize: FontSizes.FONT_13, color: warningColor),
      //UnderlineInputBorder || OutlineInputBorder
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red, width: 1.0)),
      suffixIcon: Icon(
        Icons.calendar_today,
        color: primaryLightColor,
      ),
    );
  }

  static InputDecoration textFieldAddressStyle(
      {String labelTextStr = "",
      String hintTextStr = "",
      TextEditingController controller,
      bool isFocus,
      bool isSearch = false}) {
    return InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      labelText: labelTextStr,
      labelStyle: TextStyle(
        fontSize: FontSizes.FONT_13,
        color: darkGrayColor,
      ),
      fillColor: Colors.white,
      filled: true,
      //Add th Hint text here.
      hintText: hintTextStr,
      hintStyle: TextStyle(
        fontSize: FontSizes.FONT_13,
        color: darkGrayColor,
      ),
      errorStyle: TextStyle(fontSize: FontSizes.FONT_12, color: warningColor),
      //UnderlineInputBorder || OutlineInputBorder
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: primaryLightColor, width: 1.0)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red, width: 1.0)),
      prefixIcon: isSearch ? Icon(Icons.search) : null,
      suffixIcon: isFocus
          ? IconButton(
              icon: Icon(
                Icons.clear,
              ),
              onPressed: () {
                controller.text = "";
              },
            )
          : null,
    );
  }
}
