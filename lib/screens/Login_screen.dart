import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:parcial_1/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController usernameController;
  TextEditingController passwordController;

  @override
  void initState() { 
    super.initState();
    
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(50.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              radius: 100.0,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password'
              ),
            ),
          ),

          ElevatedButton(
            onPressed: (){
              if (usernameController.text.isNotEmpty &&
                passwordController.text.isNotEmpty){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen())  
                  );
              }else{
                showDialog(
                  context: context, 
                  builder: (_) =>
                  AlertDialog(
                    title: Text('Error'),
                    content: Text('There are empty fields, you cannot enter'),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        child: Text(
                          'Aceptar',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                );
              }
            }, 
            child: Text('Login'),
          )
        ],
      ),
    );
  }
}