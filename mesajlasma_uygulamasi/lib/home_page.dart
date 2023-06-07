// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final User? user;
  final VoidCallback? onSignOut;
  const HomePage({
    Key? key,
    required this.user, required this.onSignOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: _cikisYap ,child: const Center(child: Text("Çıkış yap",style: TextStyle(color: Colors.white),)),)
        ],
        title: const Text("Anasayfa"),
        
      ),
      body:  Center(
        child: Text("Hoşgeldiniz ${user?.uid} "),
      ),
    );
  }
  
Future<void>?  _cikisYap() async{
     await FirebaseAuth.instance.signOut();

     //await Future.delayed(Duration.zero);

     onSignOut!();
  }
}
