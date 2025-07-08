import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/presentation/widgets/social_icon.dart';

class SocialLoginComponent extends StatelessWidget {
  const SocialLoginComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SocialIcon(
          icon: Icon(FontAwesomeIcons.facebook),
          color: Colors.deepPurple,
        ),
        SocialIcon(
          icon: Icon(FontAwesomeIcons.google),
          color: Colors.red,
        ),
        SocialIcon(
          icon: Icon(FontAwesomeIcons.twitter),
          color: Colors.lightBlue,
        ),
        SocialIcon(
          icon: Icon(FontAwesomeIcons.linkedin),
          color: Colors.blueAccent,
        ),
      ],
    );
  }
}
