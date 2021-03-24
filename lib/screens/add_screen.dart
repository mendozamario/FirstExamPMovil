import 'package:flutter/material.dart';
import 'package:parcial_1/models/User.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<User> _usersAdd = [];

  TextEditingController urlPictureController;
  TextEditingController nameController;
  TextEditingController lastNameController;
  TextEditingController ocupationController;
  TextEditingController birthDateController;

  @override
  void initState() { 
    super.initState();
    
    urlPictureController = TextEditingController();
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    ocupationController = TextEditingController();
    birthDateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add user'),
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
              
              if (urlPictureController.text.isNotEmpty &&
                nameController.text.isNotEmpty &&
                lastNameController.text.isNotEmpty &&
                ocupationController.text.isNotEmpty &&
                birthDateController.text.isNotEmpty) {
                  _usersAdd.add(User(
                    urlPicture: urlPictureController.text,
                    name: nameController.text,
                    lastName: lastNameController.text,
                    ocupation: ocupationController.text,
                    birthDate: DateTime.parse(birthDateController.text)
                  ));

                  Navigator.pop(context, _usersAdd);
                }else {
                  showDialog(
                    context: context, 
                    builder: (_) =>
                    AlertDialog(
                      title: Text('Error'),
                      content: Text('There are empty fields, you cannot add this porfile'),
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
              child: Text('Save'),
          )
        ],
      ),
    );
  }
}