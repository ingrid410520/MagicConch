import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_conch/Data/BaseAnswer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataManager {
  // ↓↓↓ Singleton pattern !!
  DataManager._construction() {
    print("DataManager - Construction");
    _DataAnyword = new Data_Anyword();
    Load_Anyword();
  }
  static final DataManager _instance = DataManager._construction();

  factory DataManager() {
    return _instance;
  }
  // ↑↑↑ Singleton pattern !!

  String Data_Filename = "myData";
  String key_Anyword = "Anyword";
  String TestString = "";

  // File Functions
  late SharedPreferences _prefs; // SharedPreferences 객체

  // Anyword Functions
  //static late Data_Anyword _DataAnyword;
  static late Data_Anyword _DataAnyword;

  Data_Anyword getDataAnyword() {
    //Load_Anyword();
    if (_DataAnyword.isEmpty()) {
      Load_Anyword();
    }

    return _DataAnyword;
  }

  void Init_BaseAnyword() {
    _DataAnyword.InitBase();
  }

  Future<bool> Load_Anyword() async {
    print("Load_Anyword - Hello");
    _prefs = await SharedPreferences.getInstance(); // SharedPreferences 초기화

    if (_prefs.containsKey(key_Anyword)) {
      print("Load_Anyword - Contain why ? $key_Anyword");
      Map<String, dynamic> decodemap =
          jsonDecode(_prefs.getString(key_Anyword)!);
      _DataAnyword.mapAnswer = decodemap;

      return true;
    } else {
      print("Load_Anyword - init ");
      Init_BaseAnyword();

      return false;
    }
  }

  void Save_Anyword() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString(key_Anyword, jsonEncode(_DataAnyword.mapAnswer));
  }

/////////////////// 기존 ///////////////////
  //static Map mapLoadAnyword = mapBaseAnswer;
/*  String _path = "";

  List GetAnyword_List() {
    var vMap = mapLoadAnyword;

    List result = List.empty(growable: true);

    if (!vMap.isEmpty) {
      for (var value in vMap.values) {
        if (value['bShow'].toString() == "true") {
          //print("OK");
          List vData = value['Answer'];

          for (var vSlot in vData) {
            if (vSlot[0].toString() == "true") {
              result.add(vSlot[1]);
            }
          }
        }
      }
    }
    return result;
  }*/
}
