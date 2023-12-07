import 'package:flutter/material.dart';

SnackBar customSnackBar(String message, bool isCorrect) {
  return SnackBar(
    content: Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(right: 20),
      color: const Color.fromARGB(255, 54, 76, 87),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: isCorrect ? Colors.green : Colors.red,
              )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 9,
            child: Text(
              message,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.clip),
            ),
          )
        ],
      ),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.transparent,
  );
}
