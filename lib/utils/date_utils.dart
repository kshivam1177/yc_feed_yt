import 'dart:core';

import 'package:flutter/material.dart';

class YcDateUtils {
  YcDateUtils._();

  static bool isSameDate(DateTime? date1, DateTime? date2) {
    if (date1 != null && date2 != null) {
      /*
     * Compares this DateTime object to other, returning zero if the values are equal.
Returns a negative value if this DateTime isBefore other. It returns 0 if it isAtSameMomentAs other, and returns a positive value otherwise (when this isAfter other)
     *
     * */

      final _d1 = DateTime(date1.year, date1.month, date1.day);
      final _d2 = DateTime(date2.year, date2.month, date2.day);
      debugPrint(
          "Same DATE COMPARISON::_>> date today: $_d2 and dcrDate: $_d1");
      return _d1.compareTo(_d2) == 0;
    } else {
      return false;
    }
  }

  static bool isBeforeToday(DateTime? date1) {
    if (date1 != null) {
      /*
     * Compares this DateTime object to other, returning zero if the values are equal.
Returns a negative value if this DateTime isBefore other. It returns 0 if it isAtSameMomentAs other, and returns a positive value otherwise (when this isAfter other)
     *
     * */
      final dateToday = DateTime.now();
      final _d2 = DateTime(dateToday.year, dateToday.month, dateToday.day);
      final _d1 = DateTime(date1.year, date1.month, date1.day);
      debugPrint(
          "BEFORE DATE COMPARISON::_>> date today: $_d2 and dcrDate: $_d1");
      return _d1.isBefore(_d2);
    } else {
      return false;
    }
  }

  //Use
  static DateTime? cnvtToDateObject(String dateString,
      {bool isDcrDate = false}) {
    try {
      //dcr data case => month/day/year
      //non dcr date case => day/month/year
      //timeStamp case =>  "2021-04-30T00:00:00"
      bool isTimeStamp = dateString.contains("T");
      dateString = dateString.split("T").first;

      int _monthPos = isDcrDate ? 0 : 1;
      int _dayPos = isDcrDate ? 1 : 0;
      int _yearPos = 2;

      int _day, _month, _year;

      if (dateString.isNotEmpty && !isTimeStamp) {
        if (dateString.contains("/")) {
          List<String> _splitted = dateString.split("/");
          _year = int.parse(_splitted[_yearPos]);
          _month = int.parse(_splitted[_monthPos]);
          _day = int.parse(_splitted[_dayPos]);
        } else {
          //expected
          List<String> _splitted = dateString.split("-");
          _year = int.parse(_splitted[_yearPos]);
          _month = int.parse(_splitted[_monthPos]);
          _day = int.parse(_splitted[_dayPos]);
        }
        return DateTime(_year, _month, _day);
      } else if (isTimeStamp) {
        List<String> _splitted = dateString.split("-");
        _year = int.parse(_splitted[0]);
        _month = int.parse(_splitted[1]);
        _day = int.parse(_splitted[2]);
        return DateTime(_year, _month, _day);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static String getFormattedDate(DateTime? now,
      {bool isYMD = false, DateStyle dateStyle = DateStyle.MONTH_NAME}) {
    DateTime? _dateReceived = now;
    if (_dateReceived == null) {
      _dateReceived = DateTime.now();
    }

    String _ll = "";
    switch (dateStyle) {
      case DateStyle.SLASHED:
        if (isYMD) {
          _ll =
              "${_dateReceived.year}/${_dateReceived.month > 9 ? _dateReceived.month : "0${_dateReceived.month}"}/${_dateReceived.day > 9 ? _dateReceived.day : "0${_dateReceived.day}"}";
        } else {
          _ll =
              "${_dateReceived.day > 9 ? _dateReceived.day : "0${_dateReceived.day}"}/${_dateReceived.month > 9 ? _dateReceived.month : "0${_dateReceived.month}"}/${_dateReceived.year}";
        }
        break;
      case DateStyle.DASHED:
        if (isYMD) {
          _ll =
              "${_dateReceived.year}-${_dateReceived.month > 9 ? _dateReceived.month : "0${_dateReceived.month}"}-${_dateReceived.day > 9 ? _dateReceived.day : "0${_dateReceived.day}"}";
        } else {
          _ll =
              "${_dateReceived.day > 9 ? _dateReceived.day : "0${_dateReceived.day}"}-${_dateReceived.month > 9 ? _dateReceived.month : "0${_dateReceived.month}"}-${_dateReceived.year}";
        }
        break;
      case DateStyle.MONTH_NAME:
        _ll =
            "${_dateReceived.day} ${getMonthName(_dateReceived.month)}, ${_dateReceived.year}";

        break;
      case DateStyle.MONTH_NAME_SHORT:
        _ll =
            "${_dateReceived.day} ${getMonthName(_dateReceived.month, withShortName: true)}, ${_dateReceived.year}";

        break;
      default:
        _ll = "";
    }
    return _ll;
  }

  static String getCurrent24Time(
      {DateTime? now,
      bool withSeconds = false,
      bool isColon = false,
      bool returnBlankOnNull = false}) {
    if (returnBlankOnNull && now == null) {
      return "";
    }

    if (now == null) {
      now = DateTime.now();
    }
    String fTime = "";
    String separator = isColon ? ":" : ".";
    List<String> dSplits = now.toString().split(" ");
    List<String> tSplits = dSplits[1].split(":");
    final _hours = tSplits[0].length == 1 ? "0${tSplits[0]}" : tSplits[0];
    final _minutes = tSplits[1].length == 1 ? "0${tSplits[1]}" : tSplits[1];
    final _sec = tSplits[2].split(".").first;
    final _seconds = _sec.length == 1 ? "0$_sec" : _sec;
    if (withSeconds) {
      fTime = "$_hours$separator$_minutes$separator$_seconds";
    } else {
      fTime = "$_hours$separator$_minutes";
    }
    return fTime;
  }

  static String getWeekDay(DateTime dateTime) => dateTime == null
      ? ""
      : <String>[
          "MONDAY",
          "TUESDAY",
          "WEDNESDAY",
          "THURSDAY",
          "FRIDAY",
          "SATURDAY",
          "SUNDAY"
        ][dateTime.weekday - 1];

  static String getMonthName(int month, {bool withShortName = false}) =>
      (withShortName
          ? <String>[
              'Jan',
              'Feb',
              'March',
              'April',
              'May',
              'June',
              'July',
              'Aug',
              'Sept',
              'Oct',
              'Nov',
              'Dec'
            ]
          : <String>[
              'January',
              'February',
              'March',
              'April',
              'May',
              'June',
              'July',
              'August',
              'September',
              'October',
              'November',
              'December'
            ])[month - 1];

  static DateTime get00Date() {
    return DateTime(0000);
  }

  static DateTime currDate() {
    final _now = DateTime.now();
    return DateTime(_now.year, _now.month, _now.day);
  }
}

enum DateStyle { SLASHED, DASHED, MONTH_NAME, MONTH_NAME_SHORT }
