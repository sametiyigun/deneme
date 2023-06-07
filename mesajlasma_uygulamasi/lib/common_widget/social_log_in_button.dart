// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.butonText,
    required this.butonColor,
    required this.textColor,
    required this.radius,
    this.yukseklik = 50,
    this.butonIcon,
    required this.onPressed,
    required this.butonIciTextBoyutu,
  }) : super(key: key);

  final String butonText; //
  final Color butonColor; //
  final Color textColor; //
  final double radius; //
  final double yukseklik;
  final Widget? butonIcon;
  final VoidCallback onPressed; //
  final double butonIciTextBoyutu; //

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)))),
          backgroundColor: MaterialStatePropertyAll(butonColor)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: butonIcon ?? Container(),
          ),
          Text(
            butonText,
            style: TextStyle(fontSize: butonIciTextBoyutu, color: textColor),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
