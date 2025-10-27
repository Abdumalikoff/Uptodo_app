import 'package:flutter/material.dart';

class OtherLoginWidget extends StatelessWidget {
  const OtherLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey),
              width: 169,
              height: 2,
            ),
            Text('or', style: TextStyle(color: Colors.grey)),
            Container(
              decoration: BoxDecoration(color: Colors.grey),
              width: 170,
              height: 2,
            ),
          ],
        ),
        SizedBox(height: 20),

        GoogleAppleButton(
          buttonName: 'Register with Google',
          imgae: 'image/register_page/google.png',
        ),
        SizedBox(height: 20),
        GoogleAppleButton(
          buttonName: 'Register with Apple',
          imgae: 'image/register_page/apple.png',
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),

            SizedBox(width: 5),
            Text('Login', style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ],
    );
  }
}

class GoogleAppleButton extends StatelessWidget {
  final String buttonName;
  final String imgae;
  const GoogleAppleButton({
    super.key,
    required this.buttonName,
    required this.imgae,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 13),
      shape: Border.all(color: Color(0xFF8875FF), width: 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgae),
          SizedBox(width: 10),
          Text(buttonName, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
