import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BottomHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Features",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
