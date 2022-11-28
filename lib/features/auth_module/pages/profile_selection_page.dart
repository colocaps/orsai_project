import 'package:flutter/material.dart';

class ProfileSelectionPage extends StatelessWidget {
  const ProfileSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: const Center(
            child: Text('Profile selection page'),
          ),
        ),
      ),
    );
  }
}
