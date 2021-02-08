import 'package:flutter/material.dart';
import 'package:frontend/src/model/UserInfo.dart';
import 'package:frontend/src/api/UserApis.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final formKey = new GlobalKey<FormState>();
  UserInfo _userInfo;
  Future<UserInfo> user;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: buildAccountInputs()+buildButtons(),
      ),
    );
  }

  void validate() {
    if(formKey.currentState.validate()) {
      formKey.currentState.save();
      try{
        createAccount();
        Navigator.of(context).pushNamed('/home');
      } catch(e) {
        print("Error : $e");
      }
      print("Valid Data");
    } else {
      print("Invalid Data");
    }
  }

  void createAccount(){
    user = createUserAccount(_userInfo);
  }

  void goToSignIn() {
    Navigator.of(context).pushNamed('/signIn');
  }

  List<Widget> buildAccountInputs() {
    return [
      new TextFormField(
          decoration: InputDecoration(hintText: 'First Name'),
          validator: (value) => value.isEmpty ? 'First Name cant be empty' : null,
          onSaved: (value) => _userInfo.firstName = value),
      new TextFormField(
          decoration: InputDecoration(hintText: 'Last Name'),
          validator: (value) => value.isEmpty ? 'Last Name cant be empty' : null,
          onSaved: (value) => _userInfo.lastName = value),
      new TextFormField(
          decoration: InputDecoration(hintText: 'Email Id'),
          validator: (value) => value.isEmpty ? 'Email Id cant be empty' : null,
          onSaved: (value) => _userInfo.username = value),
      new TextFormField(
          decoration: InputDecoration(hintText: 'Email Id'),
          validator: (value) => value.isEmpty ? 'Password cant be empty' : null,
          onSaved: (value) => _userInfo.password = value),
    ];
  }

  List<Widget> buildButtons() {
    return [
      new RaisedButton(
        child: new Text("Sign Up"),
        onPressed: validate,
      ),
      new RaisedButton(
        child: new Text("Sign In"),
        onPressed: goToSignIn,
      )
    ];
  }
}