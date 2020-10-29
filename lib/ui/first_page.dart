import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/color_bloc.dart';
import 'package:multi_bloc/bloc/counter_bloc.dart';
import 'package:multi_bloc/ui/master_page.dart';
import 'package:multi_bloc/ui/second_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, colorState) => MasterPage(
        backgroundColor: colorState,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (context, counterState) => Text(
                  counterState.toString(),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      ));
                },
                child: Text(
                  'Click to change',
                  style: TextStyle(color: Colors.white),
                ),
                color: colorState,
                shape: StadiumBorder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
