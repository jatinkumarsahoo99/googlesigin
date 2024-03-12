import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'common_button.dart';

class FacebookTwitterButtonView extends StatelessWidget {

  VoidCallback  onGoogleTap;
  VoidCallback  onFaceBookTap;
  VoidCallback  onTwitterTap;

   FacebookTwitterButtonView({Key? key,required this.onFaceBookTap,required this.onGoogleTap,required this.onTwitterTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _fTButtonUI();
  }

  Widget _fTButtonUI() {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: CommonButton(
            padding: EdgeInsets.zero,
            backgroundColor:  Colors.pink,
            buttonTextWidget: _buttonTextUI(isFacebook: false,isGoogle: true),
            onTap:onGoogleTap ,
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: CommonButton(
            padding: EdgeInsets.zero,
            backgroundColor: const Color(0xff3c5799),
            buttonTextWidget: _buttonTextUI(),
            onTap: onFaceBookTap,
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: CommonButton(
            padding: EdgeInsets.zero,
            backgroundColor: const Color(0xff05a9f0),
            buttonTextWidget: _buttonTextUI(isFacebook: false),
            onTap: onTwitterTap,
          ),
        ),

        const SizedBox(
          width: 7,
        ),
      ],
    );
  }

  Widget _buttonTextUI({bool isFacebook = true,bool isGoogle = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(isFacebook ? FontAwesomeIcons.facebookF : (isGoogle)? FontAwesomeIcons.google:FontAwesomeIcons.twitter,
            size: 20, color: Colors.white),
        const SizedBox(
          width: 4,
        ),
        Text(
          isFacebook ? "Facebook" :(isGoogle)? "Google": "Twitter",
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 8, color: Colors.white),
        ),
      ],
    );
  }
}
