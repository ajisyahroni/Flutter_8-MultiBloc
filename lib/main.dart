import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/color_bloc.dart';
import 'package:multi_bloc/bloc/counter_bloc.dart';
import 'package:multi_bloc/bloc/dark_theme_bloc.dart';
import 'package:multi_bloc/ui/first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(Colors.pink),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(0),
        ),
        BlocProvider<DarkThemeBloc>(
          create: (context) => DarkThemeBloc(false),
        )
      ],
      child: BlocBuilder<DarkThemeBloc, bool>(
        builder: (context, darkThemeState) => MaterialApp(
          darkTheme:
              (darkThemeState == true) ? ThemeData.dark() : ThemeData.light(),
          themeMode:
              (darkThemeState == true) ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: FirstPage(),
        ),
      ),
    );
  }
}
