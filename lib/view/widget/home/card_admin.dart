import 'package:flutter/material.dart';

class CardAdminHome extends StatelessWidget {
  const CardAdminHome(
      {super.key, required this.url, required this.title, required this.onTap});

  final String url;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(url, width: 80),
            Text(title),
          ],
        ),
      ),
    );
  }
}
