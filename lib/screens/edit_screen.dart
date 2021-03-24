import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:parcial_1/models/User.dart';

class EditScreen extends StatefulWidget {
  final User user;
  EditScreen({this.user});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String urlPicture, name, lastName, ocupation;
  DateTime birthDate;

  TextEditingController urlPictureController;
  TextEditingController nameController;
  TextEditingController lastNameController;
  TextEditingController ocupationController;
  TextEditingController birthDateController;

  @override
  void initState() { 
    User _user = widget.user;

    urlPictureController = TextEditingController(text: _user.urlPicture);
    nameController = TextEditingController(text: _user.name);
    lastNameController = TextEditingController(text: _user.lastName);
    ocupationController = TextEditingController(text: _user.ocupation);
    birthDateController = TextEditingController(text: _user.birthDate.toString());

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Edit user'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.url,
              controller: urlPictureController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Url Picture',
                suffix: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: (){
                    urlPictureController.clear();
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.name,
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Name',
                suffix: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: (){
                    nameController.clear();
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.name,
              controller: lastNameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Last name',
                suffix: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: (){
                    lastNameController.clear();
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.name,
              controller: ocupationController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Ocupation',
                suffix: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: (){
                    ocupationController.clear();
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.datetime,
              controller: birthDateController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Birth Date',
                suffix: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: (){
                    birthDateController.clear();
                  },
                ),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              urlPicture = urlPictureController.text;
              name = nameController.text;
              lastName = lastNameController.text;
              ocupation = ocupationController.text;
              birthDate = DateTime.parse(birthDateController.text);

              if (urlPictureController.text.isNotEmpty &&
                nameController.text.isNotEmpty &&
                lastNameController.text.isNotEmpty &&
                ocupationController.text.isNotEmpty &&
                birthDateController.text.isNotEmpty) {
                  
                  Navigator.pop(
                    context, 
                    User(urlPicture: urlPicture, name: name, lastName: lastName, ocupation: ocupation, birthDate: birthDate)
                  );
                }else {
                  showDialog(
                    context: context, 
                    builder: (_) =>
                    AlertDialog(
                      title: Text('Error'),
                      content: Text('There are empty fields, you cannot edit this porfile'),
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
              child: Text('Edit'),
          )
        ],
      ),
    );
  }
}