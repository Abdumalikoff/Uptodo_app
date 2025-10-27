import 'package:flutter/material.dart';
import 'package:uptodo/hello_page/first_screen.dart';

class FourthScreenWidget extends StatelessWidget {
  const FourthScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                HeaderTextWidget(text: 'Welcome to UpTodo'),
                SizedBox(height: 30),
                DiscriptionTextWidget(
                  text:
                      'Please login to your account or create new account to continue',
                ),
              ],
            ),
            Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },

                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 13),

                  color: Color(0xFF8875FF),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },

                  padding: EdgeInsets.symmetric(horizontal: 105, vertical: 13),
                  shape: Border.all(color: Color(0xFF8875FF), width: 1.5),
                  child: Text(
                    maxLines: 1,
                    'CREATE ACCAUNT',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
