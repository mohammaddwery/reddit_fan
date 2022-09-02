import 'package:flutter/widgets.dart';

class AppFonts {
  static const double _fontSize8 = 8.0;
  static const double _fontSize10 = 10.0;
  static const double _fontSize11 = 11.0;
  static const double _fontSize12 = 12.0;
  static const double _fontSize13 = 13.0;
  static const double _fontSize14 = 14.0;
  static const double _fontSize15 = 15.0;
  static const double _fontSize16 = 16.0;
  static const double _fontSize18 = 18.0;
  static const double _fontSize20 = 20.0;
  static const double _fontSize24 = 24.0;
  static const double _fontSize26 = 26.0;
  static const double _fontSize28 = 28.0;
  static const double _fontSize32 = 32.0;

  static const String _openSansFontFamilyName = 'OpenSans';

  static String get fontFamily => _openSansFontFamilyName;

  static double _getScale(context, bool withScreenMeasurement) {
    double scale = 1;
    double screenSize = MediaQuery.of(context).size.width;

    if (withScreenMeasurement) {
      if (screenSize <= 320) {
        scale = 0.65;
      } else if (screenSize > 360) {
        scale = 0.85;
      } else {
        scale = 0.9;
      }
    }
    return scale;
  }

  static double getSize8(context, {bool withScreenMeasurement = true}) {
    return _fontSize8 * _getScale(context, withScreenMeasurement);
  }

  static double getSize10(context, {bool withScreenMeasurement = true}) {
    return _fontSize10 * _getScale(context, withScreenMeasurement);
  }

  static double getSize11(context, {bool withScreenMeasurement = true}) {
    return _fontSize11 * _getScale(context, withScreenMeasurement);
  }

  static double getSize12(context, {bool withScreenMeasurement = true}) {
    return _fontSize12 * _getScale(context, withScreenMeasurement);
  }

  static double getSize13(context, {bool withScreenMeasurement = true}) {
    return _fontSize13 * _getScale(context, withScreenMeasurement);
  }

  static double getSize14(context, {bool withScreenMeasurement = true}) {
    return _fontSize14 * _getScale(context, withScreenMeasurement);
  }

  static double getSize15(context, {bool withScreenMeasurement = true}) {
    return _fontSize15 * _getScale(context, withScreenMeasurement);
  }
  static double getSize16(context, {bool withScreenMeasurement = true}) {
    return _fontSize16 * _getScale(context, withScreenMeasurement);
  }
  static double getSize18(context, {bool withScreenMeasurement = true}) {
    return _fontSize18 * _getScale(context, withScreenMeasurement);
  }

  static double getSize20(context, {bool withScreenMeasurement = true}) {
    return _fontSize20 * _getScale(context, withScreenMeasurement);
  }

  static double getSize24(context, {bool withScreenMeasurement = true}) {
    return _fontSize24 * _getScale(context, withScreenMeasurement);
  }
  static double getSize26(context, {bool withScreenMeasurement = true}) {
    return _fontSize26 * _getScale(context, withScreenMeasurement);
  }
  static double getSize28(context, {bool withScreenMeasurement = true}) {
    return _fontSize28 * _getScale(context, withScreenMeasurement);
  }

  static double getSize32(context, {bool withScreenMeasurement = true}) {
    return _fontSize32 * _getScale(context, withScreenMeasurement);
  }
}
