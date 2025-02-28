import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleUtil {
  static TextStyle notoSansKr300({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return GoogleFonts.notoSansKr(
      //
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle notoSansKr400({
    TextDecoration? decoration,
    Color? color,
    required double fontSize,
  }) {
    return GoogleFonts.notoSansKr(
      decoration: decoration,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle notoSansKr500({
    Color? color,
    TextDecoration? decoration,
    required double fontSize,
  }) {
    return GoogleFonts.notoSansKr(
      decoration: decoration,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle notoSansKr600({
    Color color = Colors.white,
    TextDecoration? decoration,
    required double fontSize,
  }) {
    return GoogleFonts.notoSansKr(
      decoration: decoration,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle notoSansKr700({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return GoogleFonts.notoSansKr(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }
}

extension AppText on String {
  String get string => this;

  Widget notoSansKr300(double fontSize, {Color? color, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: GoogleFonts.notoSansKr(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
        ),
      );

  Widget notoSansKr400(
    double fontSize, {
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) => Text(
    string,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    style: GoogleFonts.notoSansKr(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    ),
  );

  Widget notoSansKr500(double fontSize, {Color? color, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: GoogleFonts.notoSansKr(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget notoSansKr600(
    double fontSize, {
    Color? color,
    TextAlign? textAlign,
    TextStyle? style,
  }) => Text(
    string,
    textAlign: textAlign,
    style:
        style ??
        GoogleFonts.notoSansKr(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
  );
  Widget notoSansKr700(
    double fontSize, {
    Color? color,
    TextAlign? textAlign,
    TextStyle? style,
    TextOverflow? overflow,
    int? maxLines,
  }) => Text(
    string,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    style:
        style ??
        GoogleFonts.notoSansKr(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ),
  );
}
