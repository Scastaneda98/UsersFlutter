import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  String title;
  String subtitle;

  HeaderCard(this.title, this.subtitle,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}