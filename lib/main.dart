import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_events_in_flutter/chnage_thr_color_of_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const KeyEventsInFlutter(),
    );
  }
}

class KeyEventsInFlutter extends StatefulWidget {
  const KeyEventsInFlutter({super.key});

  @override
  State<KeyEventsInFlutter> createState() => _KeyEventsInFlutterState();
}

class _KeyEventsInFlutterState extends State<KeyEventsInFlutter> {
  Color backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    var sizeOfMyScreen = MediaQuery.of(context).size;
    double heightOfMyScreen =
        sizeOfMyScreen.height - (kBottomNavigationBarHeight + kToolbarHeight);
    double widthOfMyScreen = sizeOfMyScreen.width;
    double widthOfMyTextField = widthOfMyScreen * 0.7;
    double heightOfMyTextField = heightOfMyScreen * 0.05;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(children: [
          Focus(
            autofocus: true,
            onKey: (node, event) {
              if (event.isControlPressed &&
                  event.logicalKey.keyId == LogicalKeyboardKey.keyA.keyId) {
                setState(() {
                  backgroundColor = Colors.amber;
                });
              } else {
                if (event.isControlPressed &&
                    event.logicalKey.keyId == LogicalKeyboardKey.keyB.keyId) {
                  setState(() {
                    backgroundColor = Colors.blue;
                  });
                } else {
                  if (event.isControlPressed &&
                      event.logicalKey.keyId == LogicalKeyboardKey.keyC.keyId) {
                    setState(() {
                      backgroundColor = Colors.cyan;
                    });
                  } else {
                    if (event.isControlPressed &&
                        event.logicalKey.keyId ==
                            LogicalKeyboardKey.keyD.keyId) {
                      setState(() {
                        backgroundColor = Colors.deepOrange;
                      });
                    } else {}
                  }
                }
              }
              return KeyEventResult.ignored;
            },
            child: Focus(
                onKey: (node, event) {
                  // if (event.logicalKey.keyId >= 48 &&
                  //         event.logicalKey.keyId <= 57 ||
                  //     event.logicalKey.keyId ==
                  //         LogicalKeyboardKey.backspace.keyId) {
                  //   return KeyEventResult.ignored;
                  // } else {
                  //   return KeyEventResult.handled;
                  // }
                  // if (event.logicalKey.keyId >=
                  //             LogicalKeyboardKey.digit0.keyId &&
                  //         event.logicalKey.keyId <=
                  //             LogicalKeyboardKey.digit9.keyId ||
                  //     event.logicalKey.keyId ==
                  //         LogicalKeyboardKey.backspace.keyId) {
                  //   return KeyEventResult.ignored;
                  // } else {
                  //   return KeyEventResult.handled;
                  // }
                  if (event.logicalKey.isDigit()) {
                    return KeyEventResult.ignored;
                  } else {
                    return KeyEventResult.handled;
                  }
                },
                child: SizedBox(
                    height: heightOfMyTextField,
                    width: widthOfMyTextField,
                    child: const TextField())),
          )
        ]),
      ),
    );
  }
}
