import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey = new GlobalKey<ScaffoldMessengerState>();


    final validSnackBar = SnackBar(
      content: Text(
        'Your fields are correct',
        style: TextStyle(fontSize: 16.0),
      ),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
      backgroundColor: Colors.green,
    );
    final invalidSnackBar = SnackBar(
      content:
      Text('Your fields are not correct', style: TextStyle(fontSize:
      16.0)),
      action: SnackBarAction(
        label: "Not Valid!",
        textColor: Colors.white,
        onPressed: () {},
      ),
      backgroundColor: Colors.red,
    );



  @override
  Widget build(BuildContext context) {
      return  MaterialApp(
        debugShowCheckedModeBanner:false,
      home :  Scaffold (
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Forms"),
        ),
        body: Center(
            child: Card(
          elevation: 8.0,
          child: Container(
              height: 350.0,
              width: 300.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name...";
                        }

                      },
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Your name...",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || !value.contains(".")) {
                          return "Please enter valid email address!";
                        }

                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Your email...",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Please enter strong password:(";
                        }

                      },
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Your password...",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    ButtonTheme(

                      child:  MaterialButton(
                        color: Colors.purple.shade100,
                      onPressed: () {
                          if (_formKey.currentState!.validate()) {

                        scaffoldKey.currentState!.showSnackBar(validSnackBar);
                      } else {
                        // scaffoldKey.currentState!.showSnackBar(invalidSnackBar);
                      }},
                      child: SizedBox(
                        child: Text('Raised Button', style:
                        TextStyle( color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700, )
                        ),
                      ),
                    ),
                    )

                  ],
                ),
              )),
        )),
      ),
    ),
      );

  }
}
