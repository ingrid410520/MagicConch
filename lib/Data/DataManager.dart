import 'package:magic_conch/Data/BaseAnswer.dart';

class DataManager {
  DataManager.construction() {}
  static final DataManager _instance = DataManager.construction();
  static final Map mapLoadAnyword = mapBaseAnswer;

  factory DataManager() {
    return _instance;
  }

  Map GetAnyword() {
    return mapLoadAnyword;
  }
}
