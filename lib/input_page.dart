import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const buttonContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    containerColor: activeCardColor,
                    cardChild: iconContent(
                        iconName: FontAwesomeIcons.mars, iconLabel: "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    containerColor: activeCardColor,
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

class iconContent extends StatelessWidget {
  iconContent({required this.iconName, this.iconLabel});
  final iconName;
  final iconLabel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          iconLabel,
          style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.containerColor, this.cardChild});
  final Color containerColor;
  final cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
