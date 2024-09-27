import 'package:flutter/material.dart';
import 'package:login_app/lottery_app/lotto.dart';
import 'package:login_app/responsive/breakpoint.dart';
import 'package:login_app/responsive/responsive_center.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LayoutLotto extends StatelessWidget {
  const LayoutLotto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 125, 198),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 208, 105, 3),
        title: const Text('Lotto app'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ))
        ],
        automaticallyImplyLeading: false,
      ),
      body: const ResponsiveCenter(
        maxContentwidth: Breakpoint.deskTop,
        padding: EdgeInsets.all(16),
        child: Lotto(),
      ),
    );
  }
}
