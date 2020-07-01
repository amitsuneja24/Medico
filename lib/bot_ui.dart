import 'package:medico/google_assistant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import 'bot.dart';



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med Chat',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageDialogflowV2(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00796B),
        leading:  Builder(
          builder: (BuildContext context) {
    return IconButton(
    icon: const Icon(Icons.menu),
    onPressed: () {   Navigator.pop(context);
    },
    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
    },
    ),
        title: FloatingActionButton(child: Text(widget.title),onPressed:   ()=>Navigator.pop(context)
          ,),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _print,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _print() async {
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/medichat-aeqmeh-83eba599121f.json").build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle,language: Language.english);
    AIResponse response = await dialogflow.detectIntent("Hey");
    print(response.getMessage());
  }
}
