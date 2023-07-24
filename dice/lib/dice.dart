import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  int imageActive = 3;

  rollDice() {
    setState(() {
      imageActive = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/dice-$imageActive.png', width: 200),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40)),


              onPressed: rollDice, 
              child: Text('Roll Dice', 
              style: TextStyle(fontSize: 25),
              ),)
          ],
        ),
      ),
    );
  }
}