
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';
import 'package:magic_conch/Function/File_Function.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestFeild extends StatefulWidget {
  const TestFeild({super.key});

  @override
  State<TestFeild> createState() => _TestFeildState();
}

class _TestFeildState extends State<TestFeild> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _keyEdit_write = TextEditingController();
  TextEditingController _valEdit_write = TextEditingController();
  TextEditingController _keyEdit_read = TextEditingController();
  TextEditingController _valEdit_read = TextEditingController();

  late SharedPreferences _prefs; // SharedPreferences 객체

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  // SharedPreferences 초기화 함수
  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance(); // SharedPreferences 초기화
  }

  // 데이터를 저장하는 함수
  Future<void> _saveData() async {
    _prefs.setString(
        'myData', _textEditingController.text); // 'myData' 키에 데이터 저장
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('저장완료')), // 저장 완료 메시지 출력
    );
  }

  // 데이터를 로드하는 함수
  Future<void> _loadData() async {
    final myData = _prefs.getString('myData'); // 'myData' 키에 저장된 데이터 로드
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('로드완료: $myData')), // 로드 완료 메시지와 함께 데이터 출력
    );
  }

  Widget build(BuildContext context) {
    return
        //File_Test1()
        File_Test2()
        //File_Test3()
        ;
  }

  BuildMyScreen File_Test1() {
    return BuildMyScreen(
      strTitle: "Test Field",
      widBody: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textEditingController, // 입력한 데이터를 가져오기 위한 컨트롤러
              decoration: InputDecoration(
                hintText: '저장할 데이터를 입력하세요.', // 힌트 텍스트
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveData, // 데이터 저장 버튼
                  child: Text('저장하기'),
                ),
                ElevatedButton(
                  onPressed: _loadData, // 데이터 로드 버튼
                  child: Text('불러오기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BuildMyScreen File_Test2() => BuildMyScreen(
      strTitle: "Test Field2",
      widBody: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Save Data
              TextField(
                controller: _keyEdit_write,
                decoration: InputDecoration(hintText: 'Key'),
              ),
              TextField(
                controller: _valEdit_write,
                decoration: InputDecoration(hintText: 'Value'),
              ),
              ElevatedButton(
                  child: Text("Save"),
                  onPressed: () {
                    setState(() {
                      FileManager()
                          .write(_keyEdit_write.text, _valEdit_write.text);
                    });
                  },
              ),

              // Load Data
              SizedBox(height: 20),
              TextField(
                controller: _keyEdit_read,
                decoration: InputDecoration(hintText: 'Key'),
              ),
              ElevatedButton(
                  child: Text("Load"),
                  onPressed: () {
                    Future<String> _val =
                        FileManager().read(_keyEdit_read.text);
                    setState(() {
                      _val.then((value) {
                        _valEdit_read.text = value;
                      });
                    });
                  },
              ),
              TextField(
                controller: _valEdit_read,
              ),
            ],
          ),
        ),
      ));
}
