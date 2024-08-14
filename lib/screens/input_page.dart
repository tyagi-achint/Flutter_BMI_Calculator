import '../components/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import '../components/icon_button.dart';
import '../components/bottom_button.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender;
  int height = 150;
  int weight = 50;
  int age = 25;

  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Male;
                        });
                      },
                      containerColor: selectedGender == Gender.Male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: iconContent(
                          iconName: FontAwesomeIcons.mars, iconLabel: "MALE"),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      containerColor: selectedGender == Gender.Female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: iconContent(
                          iconName: FontAwesomeIcons.venus,
                          iconLabel: "FEMALE"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                containerColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT", style: kLabelStyle),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kNumberTextStyle),
                        Text("cm", style: kLabelStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xEC3795BD),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Color(0xFF5C5C5E),
                        overlayColor: Color(0x1f3795BD),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 240,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      containerColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  onPressIconButton: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  iconChild: FontAwesomeIcons.minus),
                              SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                  onPressIconButton: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  iconChild: FontAwesomeIcons.plus)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      containerColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Age",
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  onPressIconButton: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  iconChild: FontAwesomeIcons.minus),
                              SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                  onPressIconButton: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  iconChild: FontAwesomeIcons.plus)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: "CALCULATE",
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.pushNamed(
                  context,
                  '/results_page',
                  arguments: {
                    'bmiResult': calc.calculateBMI(),
                    'resultText': calc.getResult(),
                    'interpretation': calc.getInterpretation(),
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
