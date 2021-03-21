import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void> showPopUpDialog(BuildContext context) async{
    return await showDialog(context: context, builder: (context) {
      TextEditingController _textEditingController = TextEditingController();
      GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      bool isChecked = false;
      return StatefulBuilder(
        builder:  (context, setState) {
          return AlertDialog(
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: _formKey,
                    decoration: InputDecoration(hintText: 'name'),
                    controller: _textEditingController,
                    validator: (value) {
                      return value == null? 'invalid input' : null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('checked'),
                      Checkbox(value: isChecked, onChanged: (value) {
                        setState((){
                          isChecked = value;
                        });
                      },)
                    ],
                  )
                ],
              ),
            ),

            actions: <Widget>[
              TextButton(onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.of(context).pop();
                }
              }, child: Text('OK'))
            ],
          );
        },
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stateful pop up'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () async{
              await showPopUpDialog(context);
            },
            child: Text(
              'stateful pop up',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
          ),
        ),
      ),
    );
  }
}
