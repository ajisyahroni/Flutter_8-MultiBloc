import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/color_bloc.dart';
import 'package:multi_bloc/bloc/counter_bloc.dart';
import 'package:multi_bloc/bloc/dark_theme_bloc.dart';
import 'package:multi_bloc/ui/master_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    DarkThemeBloc darkThemeBloc = BlocProvider.of<DarkThemeBloc>(context);

    return BlocBuilder<ColorBloc, Color>(
      builder: (context, colorState) => MasterPage(
        backgroundColor: colorState,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (context, counterState) => GestureDetector(
                  onTap: () => counterBloc.add(counterState++),
                  child: Text(
                    counterState.toString(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text('Color theme'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPink);
                    },
                    color: Colors.pink,
                    shape: (colorState == Colors.pink)
                        ? CircleBorder(
                            side: BorderSide(color: Colors.black, width: 3))
                        : CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      colorBloc.add(ColorEvent.toAmber);
                    },
                    color: Colors.amber,
                    shape: (colorState == Colors.amber)
                        ? CircleBorder(
                            side: BorderSide(color: Colors.black, width: 3))
                        : CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPurple);
                    },
                    color: Colors.purple,
                    shape: (colorState == Colors.purple)
                        ? CircleBorder(
                            side: BorderSide(color: Colors.black, width: 3))
                        : CircleBorder(),
                  ),
                ],
              ),
              Text('System theme'),
              BlocBuilder<DarkThemeBloc, bool>(
                builder: (context, darkThemeState) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        darkThemeBloc.add(false);
                      },
                      color: Colors.yellow[50],
                      shape: (darkThemeState == false)
                          ? CircleBorder(
                              side: BorderSide(color: Colors.black, width: 3))
                          : CircleBorder(),
                    ),
                    RaisedButton(
                      onPressed: () {
                        darkThemeBloc.add(true);
                      },
                      color: Colors.black54,
                      shape: (darkThemeState == true)
                          ? CircleBorder(
                              side: BorderSide(color: Colors.white, width: 3))
                          : CircleBorder(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
