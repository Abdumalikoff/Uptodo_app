import 'package:flutter/material.dart';
import 'package:uptodo/hello_page/next_button_widget.dart';

class FirstScreenWidget extends StatelessWidget {
  const FirstScreenWidget({super.key});

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

      body: Column(
        children: [
          ImageHelloPage(image: 'image/hello_page/1.png'),
          SizedBox(height: 40),
          ScrollContainerWidget(
            firstColor: Colors.white,
            secondColor: Colors.grey,
            thirdColor: Colors.grey,
          ),
          SizedBox(height: 50),
          HeaderTextWidget(text: 'Manage your tasks'),
          SizedBox(height: 40),
          DiscriptionTextWidget(
            text:
                'You can easily manage all of your daily tasks in DoMe for free',
          ),
          SizedBox(height: 60),
          NextButtonWidget(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
        ],
      ),
    );
  }
}

class DiscriptionTextWidget extends StatelessWidget {
  final String text;
  const DiscriptionTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      maxLines: 2,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class HeaderTextWidget extends StatelessWidget {
  final String text;
  const HeaderTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ScrollContainerWidget extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;
  const ScrollContainerWidget({
    super.key,
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5,
          width: 30,
          decoration: BoxDecoration(
            color: firstColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 5,
          width: 30,
          decoration: BoxDecoration(
            color: secondColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 5,
          width: 30,
          decoration: BoxDecoration(
            color: thirdColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }
}

class ImageHelloPage extends StatelessWidget {
  final String image;
  const ImageHelloPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400,
      child: Image.asset(
        image,
        // height: 230,
        // width: 300,
      ),
    );
  }
}
