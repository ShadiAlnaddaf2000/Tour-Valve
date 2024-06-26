import 'package:flutter/material.dart';

import '../style/colors.dart';

Widget customShaderMask({required String title}) => ShaderMask(
  shaderCallback: (bounds) => const LinearGradient(
    colors: MyColors.colorList,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(bounds),
  child:  Text(
    title,
    style: const TextStyle(
        color: Color.fromRGBO(1, 195, 175, 1),
        fontSize: 38.0,
        fontFamily: 'PlayfairDisplay',
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold
    ),
    textAlign: TextAlign.left,
    maxLines: 2,
  ),
);