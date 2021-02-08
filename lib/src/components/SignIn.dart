import 'package:flutter/material.dart';
import 'package:frontend/globals.dart';
import 'package:frontend/src/api/UserApis.dart';
import 'package:frontend/src/components/Home.dart';
import 'package:frontend/src/components/SignUp.dart';
import 'package:frontend/src/model/UserInfo.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignInForm(),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final formKey = new GlobalKey<FormState>();
  Future<UserInfo> validUser;
  String username;
  String password;

  void validate() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      try{
        authorise();
      } catch(e) {
        print("Error : $e");
      }
      print("valid data");
    } else {
      print("Invalid Data");
    }
  }

  void authorise(){
    print("Validating username : $username");
    validUser = validateUser(username, password);
    validUser
        .whenComplete(() => print("Validation Completed"))
        .then((userInfo) {
          print("token : "+userInfo.token);
          user = userInfo;
          print("Routing to Home Page");
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic>route) => false);
        });
  }

  void goToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: buildInputs()+buildButtons()
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
          decoration: InputDecoration(hintText: 'Username'),
          validator: (value) =>
          value.isEmpty ? 'Username cant be empty' : null,
          onSaved: (value) => username = value),
      new TextFormField(
          decoration: InputDecoration(hintText: 'Password'),
          obscureText: true,
          validator: (value) =>
          value.isEmpty ? 'Password cant be empty' : null,
          onSaved: (value) => password = value)
    ];
  }

  List<Widget> buildButtons() {
    return [
      new RaisedButton(
        child: new Text("Sign In"),
        onPressed: validate,
      ),
      new RaisedButton(
        child: new Text("Sign Up"),
        onPressed: goToSignUp,
      )
    ];
  }
}
