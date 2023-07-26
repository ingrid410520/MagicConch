import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magic_conch/Data/BaseAnswer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String Data_Filename = "myData";
String key_Anyword = "Anyword";

class DataManager {
  // ↓↓↓ Singleton pattern !!
  DataManager.construction() {}
  static final DataManager _instance = DataManager.construction();

  factory DataManager() {
    return _instance;
  }
  // ↑↑↑ Singleton pattern !!

  late SharedPreferences _prefs; // SharedPreferences 객체
  static late Data_Anyword gData_Anyword;
  Map getAnyword() => gData_Anyword.mapAnswer;

  String TestString = "";

  void Init_Anyword() {
    gData_Anyword = new Data_Anyword();
    gData_Anyword.InitBase();
  }

  Future<bool> Load_Anyword() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance(); // SharedPreferences 초기화
    }

    if (_prefs.containsKey(key_Anyword)) {
      // 노가다..?
      Map<String, Unit_Group> decodemap = jsonDecode(_prefs.getString(key_Anyword)!);
      gData_Anyword.mapAnswer = decodemap;
      TestString = gData_Anyword.mapAnswer.keys.toString();
      return true;
    }

    return false;
  }

  void Save_Anyword() async{
    // if (_prefs == null) {
    //   _prefs = await SharedPreferences.getInstance(); // SharedPreferences 초기화
    // }
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString(key_Anyword, jsonEncode(gData_Anyword.mapAnswer)); // 이거 안됨 class 말고 맵을 로드.
  }

/////////////////// 기존 ///////////////////
  static Map mapLoadAnyword = mapBaseAnswer;
  String _path = "";

  void LoadData() async {
    final directory = await getApplicationDocumentsDirectory();
    _path = directory.path;

    //1. Anyword Load Check
    if (true) {}
  }

  String Teststr() {
    var resultString = "";
    var vMap = mapLoadAnyword;
    String Test1 = vMap.toString();
    String Test2 = vMap.values.toString();
    String Test3 = "";
    String Test4 = "";

    List result = List.empty(growable: true);

    if (!vMap.isEmpty) {
      //result = List.empty(growable: true);
      for (var value in vMap.values) {
        if (value['bShow'].toString() == "true") {
          print("OK");
          List vData = value['Answer'];
          Test3 += vData.toString();

          // vData.forEach((element) {
          //   if (element[0].toString() == "true") {
          //     Test4 += element[0].toString();
          //     result.add(element[1]);
          //   }
          // });

          for (var vSlot in vData) {
            if (vSlot[0].toString() == "true") {
              Test4 += vSlot[0].toString();
              result.add(vSlot[1]);
            }
          }
        }
      }
    }

    //resultString = Test1;
    //resultString = Test2;
    //resultString = Test3;
    //resultString = Test4;
    resultString = result.toString();

    return resultString;
  }

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
  }

  void Open() {}

  void Close() {}
}
