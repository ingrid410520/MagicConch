import 'dart:io';
import 'package:magic_conch/Data/BaseAnswer.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class FileManager {
  String _fileName = "/soraemon.txt";
  String _Route = "";
  String _Path = "";
  static final FileManager _inst = FileManager.construction();

  FileManager.construction() {}

  factory FileManager() {
    return _inst;
  }

  Future<String> getRoute() async {
    Directory __Route = await getApplicationDocumentsDirectory();
    _Route = __Route.path;
    _Path = _Route + _fileName;
    return _Route;
  }

  Future<String> read(String _strRoute, String _strFileName) async {
    final _val = File(_strRoute + _strFileName);
    return await _val.readAsString();
  }

  Future<String> read_auto() async {
    final _R = await getApplicationDocumentsDirectory();
    String getString = await File(_R.path+_fileName).readAsString();

    return getString;
  }

  Future<String> write(String _strRoute, String _strFileName, String _msg) async {
    final _val = File(_strRoute+_strFileName);
    String result = await _val.writeAsString(_msg).toString();
    return result!;
  }

  Future<String> write_auto(String _msg) async {
    final _R = await getApplicationDocumentsDirectory();
    String _strVal = await File(_R.path + _fileName).writeAsString(_msg).toString();
    return _strVal;
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
