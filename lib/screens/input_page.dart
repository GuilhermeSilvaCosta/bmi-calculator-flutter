import 'package:bmi_calculator_flutter/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter/components/icon_content.dart';
import 'package:bmi_calculator_flutter/components/reusable_card.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator_flutter/components/bottom_button.dart';
import 'package:bmi_calculator_flutter/components/round_icon_button.dart';

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? gender;
  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kInactiveCardColour;
  int height = 180;
  int weight = 60;
  int age = 19;

  void onSelectGender(Gender gender) {
    setState(() {
      this.gender = gender;
      maleCardColor = gender == Gender.male ? kActiveCardColour : kInactiveCardColour;
      femaleCardColor = gender == Gender.female ? kActiveCardColour : kInactiveCardColour;
    });
  }

  void onChangeHeight(double height) {
    setState(() {
      this.height = height.round();
    });
  }

  void onChangeWeight(int weight) {
    setState(() {
      this.weight = weight;
    });
  }

  void onChangeAge(int age) {
    setState(() {
      this.age = age;
    });
  }

  void onCalculate() {

    CalculatorBrain result = CalculatorBrain(height: height, weight: weight);

    Navigator.push(context, 
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          bmiResult: result.calculateBMI(),
          resultText: result.getResult(),
          interpretation: result.getInterpretation(),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () => onSelectGender(Gender.male),
                    colour: maleCardColor,
                    child: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE'
                    ),
                  ),
                ),
                 Expanded(
                  child: ReusableCard(
                    onTap: () => onSelectGender(Gender.female),
                    colour: femaleCardColor,
                    child: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: onChangeHeight,
                    ),
                  )
                ],
              )
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => onChangeWeight(weight - 1),
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => onChangeWeight(weight + 1),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => onChangeAge(age - 1),
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => onChangeAge(age + 1),
                            ),
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
            title: 'CALCULATE',
            onTap: onCalculate,
          ),
        ],
      ),
    );
  }
}



