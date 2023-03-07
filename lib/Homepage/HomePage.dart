// ignore_for_file: file_names, use_key_in_widget_constructors, non_constant_identifier_names

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'BottomProfilePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
            ),
            Text(
              user.email!,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return BottomProfilePage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
          IconButton(
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.question,
                width: 300,
                animType: AnimType.bottomSlide,
                dismissOnTouchOutside: true,
                dismissOnBackKeyPress: false,
                title: 'LOG OUT',
                desc: 'Are You Sure You Want to Log Out?',
                btnCancelOnPress: () {},
                btnOkOnPress: () => FirebaseAuth.instance.signOut(),
              ).show();
            },
            icon: const Icon(
              Icons.logout_outlined,
            ),
          ),
          IconButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  width: 300,
                  animType: AnimType.bottomSlide,
                  dismissOnTouchOutside: true,
                  dismissOnBackKeyPress: false,
                  title: 'Exit',
                  desc: 'Are You Sure You Want to Exit?',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () => exit(0),
                ).show();
              },
              icon: const Icon(Icons.exit_to_app_outlined))
        ],
      ),
      body: const Center(
        child: Text(
          "Home Screen",
        ),
      ),
    );
  }
}
