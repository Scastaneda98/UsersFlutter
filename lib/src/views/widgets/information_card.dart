import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  String title;
  List<String> texts;
  double cardSize;

  InformationCard(this.title, this.texts, this.cardSize,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardSize,
      child: Card(
        color: Colors.white60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            for(String text in texts)
              Text(
                text,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )
          ],
        ),
      ),
    );
  }
}