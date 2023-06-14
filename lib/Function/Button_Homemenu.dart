import 'package:flutter/material.dart';

class Button_Home extends StatelessWidget {
  Button_Home({required this.strName, required this.ButtonFunction});

  final String strName;
  final VoidCallback ButtonFunction;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        buttonColor: Colors.blue,
        child: ElevatedButton(
            onPressed: ButtonFunction,
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10,vertical: 20))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //imageIcon,
                Text(strName, style: TextStyle(fontSize: 20)),
                //Opacity(opacity: 0.0,child: imageIcon,)
              ],
            )));
  }
}
