// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'common_widget/social_log_in_button.dart';

class SingInPage extends StatelessWidget {
   final Function(User) onsingIn;
  const SingInPage({super.key, required this.onsingIn});


  void _misafirGirisi() async{
    UserCredential sonuc =  await FirebaseAuth.instance.signInAnonymously();
    onsingIn(sonuc.user!);
    print("oturum acan user id ${sonuc.user!.uid.toString()}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlaşma Uygulaması"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Oturum Açın",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const SizedBox(height: 8),
            SocialLoginButton(
              butonText: "Google ile oturum aç",
              butonColor: Colors.white,
              textColor: Colors.black87,
              radius: 10,
              yukseklik: 20,
              butonIcon: Image.asset("assets/images/1.0x/google.png"),
              onPressed: () {},
              butonIciTextBoyutu: 20,
            ),
            SocialLoginButton(
              butonText: "Facebook ile oturum aç",
              butonColor:const Color(0xFF334D92),
              textColor: Colors.white,
              radius: 10,
              yukseklik: 20,
              butonIcon: Image.asset("assets/images/1.0x/facebook.png"),
              onPressed: () {},
              butonIciTextBoyutu: 20,
            ),
            SocialLoginButton(
              butonText: "Email ile oturum aç",
              butonColor: Colors.teal,
              textColor: Colors.white,
              radius: 10,
              yukseklik: 20,
              butonIcon: const Icon(Icons.email,size: 30),
              onPressed: () {},
              butonIciTextBoyutu: 20,
            ),
            SocialLoginButton(
              butonText: "Misafir olarak giriş yap",
              butonColor: Colors.purple,
              textColor: Colors.white,
              radius: 10,
              yukseklik: 20,
              butonIcon: const Icon(Icons.add,size: 30),
              onPressed: _misafirGirisi,
              butonIciTextBoyutu: 20,
            ),

          ],
        ),
      ),
    );
  }


}
