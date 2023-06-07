import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
  const MyHomePage({
    Key? key,
    required this.title,
    this.incrementBy = 1,
    this.countLabel,
    this.addIconData,
    this.removeIconData,
    this.showToolTip = true,
  }) : super(key: key);

  final String title;
  final int incrementBy;
  final String? countLabel;
  final IconData? addIconData;
  final IconData? removeIconData;
  final bool showToolTip;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += widget.incrementBy;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter -= widget.incrementBy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.countLabel ??
                  'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: widget.showToolTip ? 'Increment' : null,
            child: Icon(widget.addIconData ?? Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: widget.showToolTip ? 'Decrement' : null,
            child: Icon(widget.removeIconData ?? Icons.remove),
          ),
        ],
      ),
    );
  }
}
