import 'package:flutter/material.dart';
import 'package:neonpen/neonpen.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number to words',
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
  late double _numberForm = 0;
  String displayName = '';
  String s1 = '';
  String s2 = '';
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Neonpen(
                color: Colors.purple,
                text: Text('workshop2',style: TextStyle(fontSize: 30),
                )),
            SizedBox(height: 10),
            TextField(
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberForm = rv;
                    });
                  } else {
                    setState(() {
                      _numberForm = 0;
                    });
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'saisir un nombre',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(width: 3, color: Colors.indigoAccent)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 3, color: Colors.green),
                    ))),
            SizedBox(height: 20),
            Text(_numberForm.toString()),
            SizedBox(height: 30),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
                onPressed: () {
                  setState(() {
                    s1 = _numberForm.toString().split('.')[0];
                    s2 = _numberForm.toString().split('.')[1];
                    s2 = _numberForm.toStringAsFixed(2).split('.')[1];
                    displayName = NumberToWordsEnglish.convert(int.parse(s1));
                    displayName += ' \$  and ' +
                        NumberToWordsEnglish.convert(int.parse(s2)) +
                        ' cents ';
                  });
                },
                child: Text("Convert to english")),
            SizedBox(height: 30),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink)),
                onPressed: () {
                  setState(() {
                    s1 = _numberForm.toString().split('.')[0];
                    s2 = _numberForm.toString().split('.')[1];
                    s2 = _numberForm.toStringAsFixed(2).split('.')[1];
                    displayName = Tafqeet.convert(s1) + ' دينار و ';
                    displayName += Tafqeet.convert(s2) + ' مليم  ';
                  });
                },
                child: Text("Convert to arabic")),
            SizedBox(height: 30),
            Card(
              child: Text(displayName),
            )
          ],
        ))),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
