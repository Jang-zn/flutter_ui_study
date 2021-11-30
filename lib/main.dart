import 'package:flutter/material.dart';
import 'package:ui_proto/widget/fancy_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<UniqueKey> _buttonKeys = [UniqueKey(),UniqueKey()];
  bool reversed = false;
  int _counter = 0;

  void _resetCounter() {
    setState(() {
      _counter=0;
      reversed=!reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _increaseButton = FancyButton(onPressed: _increase,
        key:_buttonKeys.first,
        child: Text("Increase",
            style:const TextStyle(color:Colors.white, fontWeight: FontWeight.bold))
    );
    final _decreaseButton= FancyButton(onPressed: _decrease,
        key:_buttonKeys.last,
        child: Text("Decrease",
            style:const TextStyle(color:Colors.white, fontWeight: FontWeight.bold))
    );

    List<Widget> _buttons = <Widget>[_increaseButton, _decreaseButton];
    if(reversed){
      _buttons = _buttons.reversed.toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child:
              Image.network("https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?fit=476%2C280&ssl=1",),
              margin: const EdgeInsets.all(40),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buttons[0],
                _buttons[1]
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ), 
    );
  }
  
  void _increase(){
    setState(() {
      _counter++;
    });
  }

  void _decrease(){
    setState(() {
      if(_counter>0) {
        _counter--;
      }
    });
  }
}
