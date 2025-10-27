import 'package:flutter/material.dart';
import 'package:uptodo/hello_page/first_screen.dart';
import 'package:uptodo/hello_page/next_button_widget.dart';
import 'package:uptodo/hello_page/second_screen.dart';

class ThirdSreenWidget extends StatelessWidget {
  const ThirdSreenWidget({super.key});

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
            ImageHelloPage(image: 'image/hello_page/3.png'),
            SizedBox(height: 40),
            ScrollContainerWidget(
              firstColor: Colors.grey,
              secondColor: Colors.grey,
              thirdColor: Colors.white,
            ),
            SizedBox(height: 50),
            HeaderTextWidget(text: 'Orgonaize your tasks'),
            SizedBox(height: 40),
            DiscriptionTextWidget(
              text:
                  'You can organize your daily tasks by adding your tasks into separate categories',
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
                    Navigator.pushNamed(context, '/fourth');
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
