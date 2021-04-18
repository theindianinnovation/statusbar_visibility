import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Show / Hide StatusBar';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(MyApp.title),
      centerTitle: true,
    ),
    body: Container(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Show Statusbar"),
              onPressed: showStatusBar,
            ),
            const SizedBox(height: 24),
            RaisedButton(
                child: Text("Hide Statusbar"),
                onPressed: hideStatusBar,
            ),

          ],
        ),
      ),
    ),
  );

  Future showStatusBar() =>
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  Future hideStatusBar() => SystemChrome.setEnabledSystemUIOverlays([]);
}
