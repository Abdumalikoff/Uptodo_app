import 'package:flutter/material.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({super.key});

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Text(
                'Settings',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),

              SettingsWidget(icon: Icons.settings, text: 'Settings'),
              SizedBox(height: 10),
              Text(
                'Account',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SettingsWidget(icon: Icons.person, text: 'Change account name'),
              SizedBox(height: 10),
              SettingsWidget(icon: Icons.key, text: 'Change account password'),
              SizedBox(height: 10),
              SettingsWidget(icon: Icons.image, text: 'Change account Image'),
              SizedBox(height: 10),
              Text(
                'UpToDo',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SettingsWidget(icon: Icons.grid_view, text: 'About US'),
              SizedBox(height: 10),
              SettingsWidget(icon: Icons.error_outline, text: 'FAQ'),
              SizedBox(height: 10),
              SettingsWidget(icon: Icons.bolt, text: 'Help & Feedback'),
              SizedBox(height: 10),
              SettingsWidget(icon: Icons.thumb_up_outlined, text: 'Support US'),
              SizedBox(height: 10),
              SettingsWidget(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/fourth');
                },
                showArrow: false,
                icon: Icons.logout,
                iconColor: Colors.red,
                text: 'Log out',
                textColor: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingsWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;
  final Color? iconColor; // делаем необязательным
  final Color? textColor;
  final bool showArrow;
  const SettingsWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
    this.iconColor,
    this.textColor,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color finalIconColor = iconColor ?? Colors.white;
    final Color finalTextColor = textColor ?? Colors.white;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, color: finalIconColor, size: 26),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: finalTextColor, fontSize: 18)),
            Spacer(),
            if (showArrow)
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
