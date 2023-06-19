import 'dart:io';
import 'package:magic_conch/BaseAnswer.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class MessageStorage {
  final _fileName;
  String _path = "";

  MessageStorage(this._fileName) {
    init();
  }

  void init() async {
    final directory = await getApplicationDocumentsDirectory();
    _path = directory.path;
  }

  Future<String> readFile() async {
    try {
      final file = File('$_path/$_fileName');
      return file.readAsString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> writeFile(String message) async {
    try {
      final file = File('$_path/$_fileName');
      file.writeAsString(message);
    } catch (e) {
      print(e);
    }
  }
}

class AnswerManager {
  final _fileName = "Answer.txt";
  String _path = "";
  List _list = List.empty(growable: true);
  List _baselist = BaseAnswer;

  AnswerManager() {
    init();
  }

  void init() async {
    final directory = await getApplicationDocumentsDirectory();
    _path = directory.path;
  }

  List getAnswer() {

    return _baselist;
  }

  Future<List> setAnswer() async {
    return List.empty();
  }

  Future<String> readAnswer() async {
    final file = File('$_path/$_fileName');
    try {
      print('Read as string');
      return file.readAsString();
    } catch (e) {
      print('Read error');
      return e.toString();
    }
  }

  Future<void> writeAnswer() async {
    try {
      final file = File('$_path/$_fileName');
      file.writeAsString(_list.toString());
      print("file write : $_path/$_fileName");
    } catch (e) {
      print("Error");
      print(e);
    }
  }
}

void Save_list_to_json(List _list) {
  String jsonstring = jsonEncode(_list);
  print(jsonstring);
}
