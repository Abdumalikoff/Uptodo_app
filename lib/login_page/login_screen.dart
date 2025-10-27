import 'package:flutter/material.dart';
import 'package:uptodo/hello_page/first_screen.dart';
import 'package:uptodo/login_page/other_login_methods.dart';

class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderTextWidget(text: 'Register'),
                SizedBox(height: 16),
                LoginWidget(),

                SizedBox(height: 20),
                OtherLoginWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  final VoidCallback? onValidated;
  const LoginWidget({super.key, this.onValidated});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool validateForm() {
    if (_formKey.currentState!.validate()) {
      widget.onValidated?.call();
      return true;
    }
    return false;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Enter name';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter password';
    } else if (value.length < 8) {
      return 'min 8 characters';
    } else if (_passwordController.text != _confirmPasswordController.text) {
      return ' password does not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username', style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(height: 10),
          LoginFormWidget(
            validator: validateUsername,
            hiddenText: false,
            hintText: 'Enter your Username',
            controller: _usernameController,
          ),
          SizedBox(height: 10),
          Text('Password', style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(height: 10),
          LoginFormWidget(
            validator: validatePassword,
            maxLength: 8,
            hiddenText: true,
            hintText: 'Enter your Password',
            controller: _passwordController,
          ),

          Text(
            'Confirm Password',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          LoginFormWidget(
            validator: validatePassword,
            maxLength: 8,
            hiddenText: true,
            hintText: 'Confirm your Password',
            controller: _confirmPasswordController,
          ),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushReplacementNamed(context, '/main');
              }
              ;
            },

            padding: EdgeInsets.symmetric(horizontal: 139, vertical: 13),

            color: Color(0xFF8875FF),
            child: Text(
              'REGISTER',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginFormWidget extends StatelessWidget {
  final int? maxLength;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool hiddenText;
  final String? hintText;
  LoginFormWidget({
    super.key,
    required this.hiddenText,
    required this.hintText,
    required this.controller,
    this.validator,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,

      controller: controller,
      obscureText: hiddenText,
      decoration: InputDecoration(
        counterStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16),
      maxLength: maxLength,
    );
  }
}
