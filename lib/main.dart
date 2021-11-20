import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tipsy/tip_bubble.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tipsy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Tipsy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //State Variables
  int _counter = 0;
  int _tipAmount = 10;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PreferredSize(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
        preferredSize: Size.fromHeight(100),
        child: ClipPath(
          clipper: WaveClipperTwo(flip: true),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: kAppBarColor,
            child: Center(
              child: Text(
                "Tipsy",
                style: GoogleFonts.berkshireSwash(
                    textStyle: TextStyle(fontSize: 30, color: kTipsyTextColor)),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Enter bill total',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  fontSize: 20,
                  color: kHeadingTextColor,
                ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width) / 2,
                  child: TextField(
                    style: TextStyle(
                        color: kInputTextColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 35),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      icon: Icon(FontAwesomeIcons.dollarSign,
                          color: kDollarSignColor, size: 25),
                      focusColor: kTextFieldUnderlineColor,
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Text('Choose tip',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  fontSize: 20,
                  color: kHeadingTextColor,
                ))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Expanded(
                child: TipAmountBubble(
                  onTap: () {
                    setState(() {
                      if (_tipAmount == 10) {
                        _tipAmount = 0;
                      } else {
                        _tipAmount = 10;
                      }
                    });
                  },
                  text: "10%",
                  backgroundColor: (_tipAmount == 10)
                      ? (kActiveTipAmountBubbleColor)
                      : (kInactiveTipAmountBubbleColor),
                  textColor: (_tipAmount == 10)
                      ? (kActiveTipAmountTextColor)
                      : (kInactiveTipAmountTextColor),
                ),
              ),
              Expanded(
                child: TipAmountBubble(
                  onTap: () {
                    setState(() {
                      if (_tipAmount == 15) {
                        _tipAmount = 0;
                      } else {
                        _tipAmount = 15;
                      }
                    });
                  },
                  text: "15%",
                  backgroundColor: (_tipAmount == 15)
                      ? (kActiveTipAmountBubbleColor)
                      : (kInactiveTipAmountBubbleColor),
                  textColor: (_tipAmount == 15)
                      ? (kActiveTipAmountTextColor)
                      : (kInactiveTipAmountTextColor),
                ),
              ),
              Expanded(
                child: TipAmountBubble(
                  onTap: () {
                    setState(() {
                      if (_tipAmount == 20) {
                        _tipAmount = 0;
                      } else {
                        _tipAmount = 20;
                      }
                    });
                  },
                  text: "20%",
                  backgroundColor: (_tipAmount == 20)
                      ? (kActiveTipAmountBubbleColor)
                      : (kInactiveTipAmountBubbleColor),
                  textColor: (_tipAmount == 20)
                      ? (kActiveTipAmountTextColor)
                      : (kInactiveTipAmountTextColor),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Expanded(
                child: TipAmountBubble(
                  onTap: () {
                    setState(() {
                      if (_tipAmount == 25) {
                        _tipAmount = 0;
                      } else {
                        _tipAmount = 25;
                      }
                    });
                  },
                  text: "25%",
                  backgroundColor: (_tipAmount == 25)
                      ? (kActiveTipAmountBubbleColor)
                      : (kInactiveTipAmountBubbleColor),
                  textColor: (_tipAmount == 25)
                      ? (kActiveTipAmountTextColor)
                      : (kInactiveTipAmountTextColor),
                ),
              ),
              Expanded(
                flex: 2,
                child: TipAmountBubble(
                  onTap: () {
                    setState(() {
                      if (_tipAmount == -1) {
                        _tipAmount = 0;
                      } else {
                        _tipAmount = -1;
                      }
                    });
                  },
                  text: "Custom tip",
                  backgroundColor: (!((_tipAmount == 0) ||
                          (_tipAmount == 10) ||
                          (_tipAmount == 15) ||
                          (_tipAmount == 20) ||
                          (_tipAmount == 25)))
                      ? (kActiveTipAmountBubbleColor)
                      : (kInactiveTipAmountBubbleColor),
                  textColor: (!((_tipAmount == 0) ||
                          (_tipAmount == 10) ||
                          (_tipAmount == 15) ||
                          (_tipAmount == 20) ||
                          (_tipAmount == 25)))
                      ? (kActiveTipAmountTextColor)
                      : (kInactiveTipAmountTextColor),
                ),
              )
            ]),
            Text('Split',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  fontSize: 20,
                  color: kHeadingTextColor,
                ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  onPressed: () {
                    setState(() {
                      if (_counter > 0) {
                        _counter -= 1;
                      }
                    });
                  },
                  icon: FontAwesomeIcons.minus,
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                RoundIconButton(
                  onPressed: () {
                    setState(() {
                      if (_counter < 50) {
                        _counter += 1;
                      }
                    });
                  },
                  icon: FontAwesomeIcons.plus,
                )
              ],
            ),
            Expanded(
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kResultCardColor,
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Total per person", style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: kHeadingTextColor,
                        ))),
                    Text("\$45.05"),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text("bill", style:GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: kHeadingTextColor,
                                ))),
                            Text("\$37.54"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("tip", style:GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: kHeadingTextColor,
                                ))),
                            Text("\$7.51"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor:
          kBackgroundColor, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.onPressed, required this.icon});

  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: kSplitTextColor),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 30.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
    );
  }
}
