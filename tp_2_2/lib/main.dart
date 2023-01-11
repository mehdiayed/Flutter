import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();

}

class MyAppState extends State<MyApp> {
  late double _numberFrom=0;
  String initialValue='';
  String initialValue1='';
  late double converion=0;

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

   double convert()
   {
     print("hello"+ initialValue + initialValue1);
     switch(initialValue1){

       case 'meters' : if(initialValue=='kilometers')
         {
           converion=_numberFrom *1000;
           print(converion);

         }
         break;
       case 'kilometers' : if(initialValue=='meters')
       {
         converion=_numberFrom/1000;
         print(converion);
       }
       break;
       case 'grams' : if(initialValue=='kilograms')
       {
         converion=_numberFrom *1000;
         print(converion);
       }
       break;
       case 'kilograms' : if(initialValue=='grams')
       {
         converion=_numberFrom/1000;
         print(converion);
       }
     }
     setState(() {
       converion=converion;
     });
     return converion;
   }

  @override
  Widget build(BuildContext context) {
    final List<String> _measures = [
      'Choose one',
      'meters',
      'kilometers',
      'grams',
    ];
    initialValue = _measures.first;
    initialValue1 = _measures.first;

    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Measures Converter'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text("Value" , style: TextStyle(fontSize: 22, fontFamily:HttpHeaders.ifNoneMatchHeader, color: Colors.pink),),
              SizedBox(height:10),
              TextField(
                onChanged: (text){
                 var  rv = double.tryParse(text);
                 if(rv != null)
                   {
                     setState(() {
                       _numberFrom=rv;
                     });
                   }
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height:20),
              Text("From" , style: TextStyle(fontSize: 25, fontFamily:HttpHeaders.ifNoneMatchHeader, color: Colors.pink),),

              SizedBox(height:20),
              DropdownButton<dynamic>(
                  value: initialValue,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),

                  items: _measures.map<DropdownMenuItem<dynamic>>((String value) {
                    return DropdownMenuItem<dynamic>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                onChanged: (newValue) {
                  initialValue = newValue!;
                  print(initialValue);
                }
                 ),
              SizedBox(height: 20),
              Text("To" , style: TextStyle(fontSize: 25, fontFamily:HttpHeaders.ifNoneMatchHeader, color: Colors.pink),),
              SizedBox(height: 20),
              DropdownButton<String>(
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  value: initialValue1,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    initialValue1 = newValue!;
                    print(initialValue1);

                  }),
              SizedBox(height: 20 ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink)),
                  onPressed: () {
                    convert();
                    print(converion);
                  },
                  child: Text("Convert")),
              SizedBox(height: 23 ),
              Card(
                child: Text("the result is "+ converion.toString()),
              )
            ],
          )
        ),
      ),
    );
  }
}
