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
                        GestureDetector(
                          onTap: () {
                            diceCounter.roll();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                  Colors.black, BlendMode.modulate),
                              child: Image.asset(
                                  'assets/images/dice${diceCounter.left}.png'),
                            ),
                          ),
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
                        GestureDetector(
                          onTap: () {
                            diceCounter.roll();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                  Colors.black, BlendMode.modulate),
                              child: Image.asset(
                                  'assets/images/dice${diceCounter.right}.png'),
                            ),
                          ),
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
