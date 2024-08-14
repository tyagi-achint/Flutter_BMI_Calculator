import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const buttonContainerColor = Color(0xFFEB1555);

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF0A0E21),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
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
                        ? activeCardColor
                        : inactiveCardColor,
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
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: iconContent(
                        iconName: FontAwesomeIcons.venus, iconLabel: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              containerColor: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    containerColor: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    containerColor: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: buttonContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
