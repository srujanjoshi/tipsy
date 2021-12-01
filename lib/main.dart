import 'dart:ffi';

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
  int _split = 1;
  int _tipAmount = 10;

  double _totalPerPerson = 0;
  double _billPerPerson = 0;
  double _tipPerPerson = 0;

  final billTotalController = TextEditingController();

  //
  // @override
  // void initState(){
  //   super.initState();
  //   //Start listening to changes
  //   billTotalController.addListener(_updateResult);
  // }

  @override
  void dispose() {
    //Clean up controller when this widget is removed from the widget tree.
    billTotalController.dispose();
    super.dispose();
  }

  void _updateResult() {
    print(double.parse(billTotalController.text));
    double _billTotal = double.parse(billTotalController.text);
    _billPerPerson = _billTotal / _split;
    _tipPerPerson = _billPerPerson * (_tipAmount / 100);
    _totalPerPerson = _billPerPerson + _tipPerPerson;
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
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:EdgeInsets.fromLTRB(80, 0, 0, 0),
                      child: Text('Enter bill total',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontSize: 20,
                            color: kHeadingTextColor,
                          ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("\$",
                            style: GoogleFonts.karla(
                                textStyle: TextStyle(
                              fontSize: 30,
                              color: kDollarSignColor,
                            ))),
                        Container(
                          width: (MediaQuery.of(context).size.width) *(1/3),
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                          child: TextField(
                            onChanged: (s) {
                              setState(() {
                                _updateResult();
                              });
                            },
                            controller: billTotalController,
                            style: GoogleFonts.karla(
                                textStyle: TextStyle(
                              fontSize: 35,
                              color: kInputTextColor,
                              fontWeight: FontWeight.w800,
                            )),
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              focusColor: kTextFieldUnderlineColor,
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                      child: Text('Choose tip',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontSize: 20,
                            color: kHeadingTextColor,
                          ))),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 0,horizontal: 70),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: TipAmountBubble(
                                    onTap: () {
                                      setState(() {
                                        if (_tipAmount == 10) {
                                          _tipAmount = 0;
                                        } else {
                                          _tipAmount = 10;
                                        }
                                        _updateResult();
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
                                        _updateResult();
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
                                        _updateResult();
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: TipAmountBubble(
                                    onTap: () {
                                      setState(() {
                                        if (_tipAmount == 25) {
                                          _tipAmount = 0;
                                        } else {
                                          _tipAmount = 25;
                                        }
                                        _updateResult();
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
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                      child: Text('Split',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontSize: 20,
                            color: kHeadingTextColor,
                          ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          onPressed: () {
                            setState(() {
                              if (_split > 1) {
                                _split -= 1;
                              }
                              _updateResult();
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                        Text(
                          '$_split',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        RoundIconButton(
                          onPressed: () {
                            setState(() {
                              if (_split < 50) {
                                _split += 1;
                              }
                              _updateResult();
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kResultCardColor,
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Total per person",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              fontSize: 20,
                              color: kResultCardTextColor,
                            ))),
                        Text("\$" + _totalPerPerson.toStringAsFixed(2),
                            style: GoogleFonts.karla(
                                textStyle: TextStyle(
                              fontSize: 65,
                              color: kInputTextColor,
                              fontWeight: FontWeight.w800,
                            ))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("bill",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                  fontSize: 20,
                                  color: kResultCardTextColor,
                                ))),
                            Text("\$" + _billPerPerson.toStringAsFixed(2),
                                style: GoogleFonts.karla(
                                    textStyle: TextStyle(
                                  fontSize: 25,
                                  color: kInputTextColor,
                                  fontWeight: FontWeight.w800,
                                ))),
                          ],
                        ),
                        Column(
                          children: [
                            Text("tip",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                  fontSize: 20,
                                  color: kResultCardTextColor,
                                ))),
                            Text("\$" + _tipPerPerson.toStringAsFixed(2),
                                style: GoogleFonts.karla(
                                    textStyle: TextStyle(
                                  fontSize: 25,
                                  color: kInputTextColor,
                                  fontWeight: FontWeight.w800,
                                ))),
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
