import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:medico/ui/Home.dart';
import 'package:medico/widgets/botton_nav_bar.dart';
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // FirebaseUser users;
    Future<String> _authuser(LoginData data) async {
      print('${data.name} , ${data.password}');
      FirebaseUser user;
      try{
         user=(await FirebaseAuth.instance.signInWithEmailAndPassword(email: data.name, password: data.password)).user;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user,)));
      }catch(e){
        print(e.message);
      }

      return Future.delayed(Duration(seconds: 4)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Home(user: user,))));

    }
    Future<String> _authuser1(LoginData data) async {
      print('${data.name} , ${data.password} ');
      FirebaseUser user;
     user= (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data.name, password: data.password)).user;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home(user: user,)));


      return Future.delayed(Duration(seconds: 4)).then((value) =>
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Home(user: user,))));
    }
      return FlutterLogin(
        title: 'Medico',logo: 'assets/icon/vet.png',
        onSignup: _authuser1,
        onLogin:  _authuser,
        onRecoverPassword: null,
        theme: LoginTheme(
            pageColorLight: Color(0xffffffff),
            accentColor: Color(0x0F00796B),
            titleStyle: TextStyle(
                color: Color(0xFF00796B),
                fontWeight: FontWeight.w500
            )

        )
    );

  }
}
