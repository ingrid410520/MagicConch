import 'package:flutter/cupertino.dart';
import 'package:magic_conch/Function/Build_MyScreen.dart';

class Screen_ADtest extends StatefulWidget {
  const Screen_ADtest({super.key});

  @override
  State<Screen_ADtest> createState() => _Screen_ADtestState();
}

class _Screen_ADtestState extends State<Screen_ADtest> {
  @override
  Widget build(BuildContext context) {
    return BuildMyScreen(
        strTitle: "AD Test",
        widBody: Padding(
          padding: EdgeInsets.all(5),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Ready to Ads")
            ],
          )),
        ));
  }
}
