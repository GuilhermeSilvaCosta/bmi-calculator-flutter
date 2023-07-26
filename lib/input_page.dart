import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Card(colour: Color(0xFF1D1E33))),
                Expanded(child: Card(colour: Color(0xFF1D1E33))),
              ],
            ),
          ),
          Expanded(child: Card(colour: Color(0xFF1D1E33))),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Card(colour: Color(0xFF1D1E33))),
                Expanded(child: Card(colour: Colors.blue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({super.key, required this.colour});

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(16.0),
    );
  }
}