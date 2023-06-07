// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mesajlasma_uygulamasi/home_page.dart';

import 'sing_in_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
User? _user;



  @override
   void initState() {
    super.initState();
    _checkUser();
  
  }
 
  @override
  Widget build(BuildContext context) {
    
      if(_user == null){
        return  SingInPage(onsingIn: (user){
          
_updateUser(user);
        },);
      }else{
        return HomePage(user: _user, onSignOut: () {
         // _updateUser(_user);
          _checkUser();
          print(_user!.uid.toString());
        },);
      }


    
  }

  Future<void> _checkUser() async {
    final user = await FirebaseAuth.instance.currentUser;
    if(user != null){
      print("check userin altındaki id " + user.uid.toString());
    }

    if (user != null) {
      setState(() {
        _user = user;
      }
      );
    }else{setState(() {
      _user = null;
    });}
  }
  
void _updateUser(User? user) {
  setState(() {
    _user = user;
  });
}

}
