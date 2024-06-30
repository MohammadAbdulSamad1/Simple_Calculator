import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operator = '';

  buttonpressed(String btn) {
    setState(() {
      if (btn == 'clear') {
        output = '0';
        num1 = 0;
        num2 = 0;
        operator = "";
      } else if (btn == '+' || btn == '-' || btn == '*' || btn == '/') {
        num1 = double.parse(output);
        output = "0";
        operator = btn;
      } else if (btn == '=') {
        num2 = double.parse(output);
        if (operator == '+') {
          output = (num1 + num2).toStringAsFixed(1);
        } else if (operator == '-') {
          output = (num1 - num2).toStringAsFixed(1);
        } else if (operator == '*') {
          output = (num1 * num2).toStringAsFixed(1);
        } else if (operator == '/') {
          output = (num1 / num2).toStringAsFixed(1);
        }
        num1 = 0;
        num2 = 0;
        operator = '';
      } else if (btn == '.') {
        if (output.contains('.')) {
          print('already contains .');
        } else {
          output += btn;
        }
      } else {
        if (output == '0') {
          output = btn;
        } else {
          output += btn;
        }
      }
      // output = double.parse(output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String btn) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: (MediaQuery.of(context).size.height) * .1,
        child: OutlinedButton(
          onPressed: () => buttonpressed(btn),
          child: Text(
            btn,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: (MediaQuery.of(context).size.height) * .037),
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double widthOfScreen = MediaQuery.of(context).size.width;
    double heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Icon(Icons.close),
              style: ButtonStyle(
                shadowColor: null,
              ),
            ),
            SizedBox(
              width: widthOfScreen * .15,
            ),
            Container(child: const Text('Calculator')),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            // color: Colors.amber,
            height: heightOfScreen * .3,
            alignment: Alignment.centerRight,
            child: Text(
              output,
              style: TextStyle(
                  fontSize: heightOfScreen * .1, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 2,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('*'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('clear'),
                    buildButton('='),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
