import 'package:flutter/material.dart';
import 'package:interview_app/utils/global_providers/global_providers.dart';

class App extends StatelessWidget {
  const App({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
        title: 'Interview Test',
        
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        // theme: lightTheme,
        // darkTheme: darkTheme,
      ),
    );
  }
}
