import 'dart:ui';
import 'package:flutter/material.dart';
import 'main.dart';

class LoginPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    
    final UserName =  TextField(
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        fillColor: Colors.white, filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "UserName",
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final PasswordField = TextField(
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        fillColor: Colors.white, filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
          
    );


    final loginButton = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.amber,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: (){
              Navigator.pushNamed(context, '/landing');
            },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
    );
      
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/Test.jpg"), fit: BoxFit.cover),
          ),
           
          child: BackdropFilter( 
            filter: ImageFilter.blur(sigmaX: 5.01, sigmaY: 5.01),
              child: Padding(

                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    SizedBox(height: 100.0),

                    Text("HeadMe", style:TextStyle(fontFamily: 'Montserrat', fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.black) ),

                    SizedBox(height: 25.0),

                    UserName,

                    SizedBox(height: 25.0,),

                    PasswordField,

                    SizedBox(height: 35.0),

                    loginButton,

                  ],
                ),
              ),
          ),
         


        ),
      
      
      ),

    );
  }
}