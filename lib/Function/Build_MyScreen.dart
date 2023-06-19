import 'package:flutter/material.dart';
import 'package:magic_conch/main.dart';
import 'package:get/get.dart';

class BuildMyScreen extends StatefulWidget {
  BuildMyScreen({
    required this.strTitle,
    required this.widBody,
    this.action,
  });

  final String strTitle;
  final Widget widBody;
  final List<Widget>? action;

  @override
  State<BuildMyScreen> createState() => _BuildMyScreenState();
}

class _BuildMyScreenState extends State<BuildMyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.strTitle),
          backgroundColor: Colors.blueAccent,
          actions: widget.action
        ),
        body: widget.widBody);
  }
}
