import 'dart:math';

import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  const FancyButton({Key? key, required this.onPressed, required this.child}) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:_getColors(),
      child:ElevatedButton(
        child : widget.child,
        onPressed: widget.onPressed,
      )
    );
  }
  Color _getColors(){
    return _buttonColors.putIfAbsent(this, ()=>colors[next(0,5)]);
  }
}

Map<_FancyButtonState, Color> _buttonColors={};
final _random = Random();
int next(int min, int max) => min+_random.nextInt(max-min);
List<Color> colors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.amberAccent,
  Colors.lightBlueAccent
];
