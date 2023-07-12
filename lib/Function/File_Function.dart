import 'package:shared_preferences/shared_preferences.dart';

class FileManager {
  String _Route = "";
  late SharedPreferences _prefs;
  static final FileManager _inst = FileManager.construction();

  FileManager.construction()
  {
    _init_SP();
  }

  Future<void> _init_SP() async {
    _prefs = await SharedPreferences.getInstance(); // SharedPreferences 초기화
  }

  factory FileManager() {
    return _inst;
  }

  Future<String> getRoute() async {
    _Route = "";
    return _Route;
  }

  Future<String> read(String _strKey) async {
    final _returns = _prefs.getString(_strKey);
    return _returns.toString();
  }

  Future<void> write(String _strKey, var _val) async {
    _prefs.setString(_strKey, _val.toString());
  }

}
