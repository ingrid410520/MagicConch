import 'package:magic_conch/Data/BaseAnswer.dart';
import 'package:path_provider/path_provider.dart';

class DataManager {
  DataManager.construction() {}
  static final DataManager _instance = DataManager.construction();
  static Map mapLoadAnyword = mapBaseAnswer;
  String _path = "";

  factory DataManager() {
    return _instance;
  }

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
        if (value['bShow'] == true) {
          print("OK");
        }

        var vData = value['Answer'];
        Test3 += vData.toString();
        if (vData[0][0].toString() == "true") {
          Test4 += vData[0][1].toString();
          result.add(vData[0][1]);
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
    List result = List.empty(growable: true);
    if (!mapLoadAnyword.isEmpty) {
      result = List.empty(growable: true);
      for (var value in mapLoadAnyword.values) {
        var vData = value['Answer'];

        if (vData[0]) {
          result.add(vData[1]);
        }
      }
    }
    return result;
  }

  void Open() {}

  void Close() {}
}
