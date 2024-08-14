import 'package:flutter/material.dart';

import '../components/constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map<String, dynamic>;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF0A0E21),
          titleTextStyle: kAppBarTitleTextStyle,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                containerColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      args['resultText'].toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      args['bmiResult'],
                      style: kBMITextStyle,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      args['interpretation'],
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
