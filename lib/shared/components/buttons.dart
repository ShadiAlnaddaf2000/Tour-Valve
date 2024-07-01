import 'package:flutter/material.dart';

Widget defaultTextButton({
  required Function function1,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function1();
      },
      child: Text(
        text.toUpperCase(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget defaultButton({
  double height = 50,
  required Color background,
  required String text,
  required void Function()? onPressed,
  FormFieldValidator? validate,
  bool isUpperCase = true,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: background,
          //  color: Color.fromRGBO(8, 135, 239, 1),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
