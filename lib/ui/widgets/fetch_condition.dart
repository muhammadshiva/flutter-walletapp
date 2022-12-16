import 'package:flutter/material.dart';

class ErrorFetch extends StatelessWidget {
  final String message;
  final String labelButton;
  final Image? imagePath;
  final Function() onButtonPressed;

  const ErrorFetch(
      {Key? key,
      required this.message,
      this.labelButton = "Coba Lagi",
      this.imagePath,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              size: 45,
              color: Colors.red,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 250,
              child: Text(
                message,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            // ElevatedButton(onPressed: () {}, title: "Coba Lagi")
            ElevatedButton(onPressed: () {}, child: Text('Coba Lagi')),
          ],
        ),
      ],
    );
  }
}
