import 'package:flutter/material.dart';
import 'package:uptodo/hello_page/first_screen.dart';
import 'package:uptodo/hello_page/next_button_widget.dart';

class SecondScreenWidget extends StatelessWidget {
  const SecondScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/fourth');
          },
          child: Text(
            'SKIP',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ImageHelloPage(image: 'image/hello_page/2.png'),
            SizedBox(height: 40),
            ScrollContainerWidget(
              firstColor: Colors.grey,
              secondColor: Colors.white,
              thirdColor: Colors.grey,
            ),
            SizedBox(height: 50),
            HeaderTextWidget(text: 'Create daily routine'),
            SizedBox(height: 40),
            DiscriptionTextWidget(
              text:
                  'In Uptodo  you can create your personalized routine to stay productive',
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BackButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                NextButtonWidget(
                  onPressed: () {
                    Navigator.pushNamed(context, '/third');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const BackButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text('BACK', style: TextStyle(color: Colors.grey, fontSize: 16)),
    );
  }
}
