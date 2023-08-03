import 'package:flutter/material.dart';

class ss extends StatefulWidget {
  const ss({Key? key}) : super(key: key);

  @override
  State<ss> createState() => _ssState();
}

class _ssState extends State<ss> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Button_Screenback extends StatefulWidget {
  Button_Screenback({this.context, this.label, required this.routename, this.style});

  final BuildContext? context;
  final Widget? label;
  String routename = '/home';
  ButtonStyle? style;

  @override
  State<Button_Screenback> createState() => _Button_ScreenbackState();
}

class _Button_ScreenbackState extends State<Button_Screenback> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.arrow_back_rounded),
      //label: (widget.label == null ? Text("1") : Text("2") ),
      label: (widget.label == null ? Text("back to main") : widget.label!),
      style: widget.style,
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          Navigator.popAndPushNamed(context, widget.routename);
        }
      },
    );
  }
}
