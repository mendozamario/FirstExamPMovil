import 'package:flutter/material.dart';
import 'package:parcial_1/models/User.dart';
import 'package:parcial_1/screens/add_screen.dart';
import 'package:parcial_1/screens/edit_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  final String username;
  HomeScreen({this.username});
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() { 
    String _username = widget.username;
    
    
    super.initState();
  }

  List<User> _users = [
    User(urlPicture: 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260', name: 'Mario', lastName: 'Mendoza', ocupation: 'Boss', birthDate: DateTime(2002, 02, 11)),
    User(urlPicture: 'https://images.pexels.com/photos/2078265/pexels-photo-2078265.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260', name: 'Eduer', lastName: 'Calvo', ocupation: 'Engineer', birthDate: DateTime(2002, 01, 10)),
    User(urlPicture: 'https://images.pexels.com/photos/1759530/pexels-photo-1759530.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260', name: 'Andres', lastName: 'Agudelo', ocupation: 'Product Manager', birthDate: DateTime(1998, 09, 15)),
    User(urlPicture: 'https://images.pexels.com/photos/7223921/pexels-photo-7223921.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500', name: 'Orlando', lastName: 'Rojano', ocupation: 'Cheff', birthDate: DateTime(2000, 05, 06)),
    User(urlPicture: 'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260', name: 'Jesus', lastName: 'Rivera', ocupation: 'Teacher', birthDate: DateTime(1993, 12, 24)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                  'add user -- .: ' + widget.username + ' :.'
                ),
      ),

      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index){
          return ListTile(
            

            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => EditScreen(user: _users[index]), 
                ), 
              ).then((value) {
                if (value != null) {
                  setState(() {
                    _users.removeAt(index);
                    _users.insert(index, value);
                  });
                }
              });
            },

            onLongPress: (){
              _deleteUser(context, _users[index]);               
            },
            title: Text(_users[index].name + ' ' + _users[index].lastName),
            subtitle: Text(_users[index].ocupation),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_users[index].urlPicture),
            ),
            trailing: Column(
              children: <Widget>[
                Text(formatBirthDate(_users[index].birthDate)),
                Text(calculateAge(_users[index].birthDate)),
              ],
            ),
            
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (_) => AddScreen()
            ),
          ).then((result){
            _users.addAll(result);
            setState(() {});
          }
          );
        },
        tooltip: 'Add User',
        child: Icon(Icons.add),
      ),
    );
  }

  _deleteUser (context, User user) {
    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: Text('Delete user'),
        content: Text('Are you sure to delete this user?'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: (){
              setState(() {
                this._users.remove(user);
                Navigator.pop(context);            
              });
            }, 
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      )
    );
  }
}

String calculateAge(DateTime dateBirth) {

  var dateNow = DateTime.now();
  var dateFormat = DateFormat('yyyy');

  int yearNow = int.parse(dateFormat.format(dateNow));
  int yearBirth = int.parse(dateFormat.format(dateBirth));

  int calculate = yearNow - yearBirth;
  return calculate.toString();
}

String formatBirthDate(DateTime dateBirth) {
  var dateFormat = DateFormat('dd-MM-yyyy');

  String date = dateFormat.format(dateBirth);
  return date;
}