import 'package:flutter/material.dart';
import './bloc/bloc.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String email;

  String password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.amber.withOpacity(0.46),
      ),
      title: 'Bolc_Pattern',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "boloc_pattern",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            StreamBuilder(
                stream: bloc.email,
                builder: (context , snapshot){
              return TextField(
//                onChanged: (String value){
//                  setState(() {
//                    email=value;
//                    print('email:$email');
//                  });
//                },


              onChanged: (value){
                bloc.emailChange(value);

              },
                decoration: InputDecoration(
                  errorText: snapshot.error,
                    labelText: ' UserName',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    )),
              );
            }),

            StreamBuilder(
                stream: bloc.password,
                builder: (context, snapshot){
              return TextField(
//                onChanged: (String value){
//                  setState(() {
//                    password=value;
//                    print('password: $password');
//                  });
//                },

              onChanged: (value){

                bloc.passwordChange(value);

                },
                decoration: InputDecoration(
                    errorText: snapshot.error,
                    labelText: ' Password',
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    )),
              );
            }),

            Center(
              child: RaisedButton(
                onPressed: () {
                  print('email: $email,password:$password');
                },
                child: Text('LOGIN'),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
