import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'dice_counter.dart';

class DiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final diceCounter = DiceCounter();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Observer(builder: (_) {
                    return Column(
                      children: [
                        TextButton(
                          onPressed: diceCounter.roll,
                          child: Image.asset(
                              'assets/images/${diceCounter.left}.png'),
                        ),
                        Text(diceCounter.left.toString()),
                      ],
                    );
                  }),
                ),
                Expanded(
                  child: Observer(builder: (_) {
                    return Column(
                      children: [
                        TextButton(
                          onPressed: diceCounter.roll,
                          child: Image.asset(
                              'assets/images/${diceCounter.right}.png'),
                        ),
                        Text(diceCounter.right.toString()),
                      ],
                    );
                  }),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Observer(
                builder: (_) => Text(
                  'Total ${diceCounter.total}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 16,
                      fontFamily: 'Verdana'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
