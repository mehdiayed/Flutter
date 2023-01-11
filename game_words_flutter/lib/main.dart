import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 6,
        children: <Widget>[
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "A",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "B",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "C",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "D",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "E",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "F",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "G",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "H",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "I",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "J",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "K",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "L",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "M",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "N",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "O",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "P",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "Q",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "R",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "S",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "T",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "U",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "V",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "W",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "X",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "Y",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            color: Colors.teal[200],
            child: TextButton(
              child: Text(
                "Z",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      // TextButton(
      //   style: ButtonStyle(
      //     foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      //   ),
      //   onPressed: () {},
      //   child: Text('TextButton'),
      // )
    );
  }
}
