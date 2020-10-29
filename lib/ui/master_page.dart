import 'package:flutter/material.dart';

class MasterPage extends StatelessWidget {
  final Color backgroundColor;
  final Widget body;

  const MasterPage({this.backgroundColor = Colors.pink, this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Flutter Multi BLoC'),
      ),
      body: body,
    );
  }
}
