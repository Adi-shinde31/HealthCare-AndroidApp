import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:android_projects/auth.dart';
import 'package:android_projects/home.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _setEmailId(){
    setState(() {
      final email = _emailController.text;
    });
  }
  bool _isLogin = true;
  String? errorMessage = '';

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(String title, TextEditingController controller){
    return TextField(
      controller: controller,
      // keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: title,
      ),
      obscureText: (title == "password") ? true : false,
    );
  }

  Widget _errorMessage(){
    return Text(errorMessage == '' ? '' : 'Hmm!! $errorMessage');
  }


  Widget _submitButton(){

    return MaterialButton(
      minWidth: double.infinity,
      onPressed: _isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      color:Colors.teal,
      textColor: Colors.white,
      child: Text(_isLogin ? "Login" : "Register"),
    );
  }

  Widget _loginOrRegistration(){
    return MaterialButton(
        onPressed: () {
          setState(() {
            _isLogin = !_isLogin;
          });
        },
        textColor: Colors.teal,
        child: Text(_isLogin ? 'Register Instead' : 'Login Instead')
    );
  }

  @override
  Widget build(BuildContext  context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Account'),
          backgroundColor: Colors.teal,
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(Icons.navigate_next),
          //     tooltip: 'Go to the next page',
          //     onPressed: () {
          //       Navigator.push(context, MaterialPageRoute<void>(
          //         builder: (BuildContext context) {
          //           return const Home();
          //
          //         },
          //       ));
          //     },
          //   ),
          // ],
        ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 35,
              color: Colors.teal,
              fontWeight: FontWeight.bold
            )
          ),

          Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
                child: Column(
                  children: <Widget>[
                    _entryField('email', _emailController),
                    _entryField('password', _passwordController),
                    _errorMessage(),
                    _submitButton(),
                    _loginOrRegistration()
                  ]
                )
            ),
          )

        ],
      )

    );
  }
}
