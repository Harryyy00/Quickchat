import 'package:flutter/material.dart';
import 'package:quickchat_ui/core/utils/custom_color.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.icon,
  });

  final String title;
  final String subTitle;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: theme.brightness == Brightness.dark
                      ? CustomColor.instagramBlack
                      : Colors.grey,
                ),
                textAlign: TextAlign.center),
            const SizedBox(height: 15),
            Text(subTitle,
                style: TextStyle(
                  fontSize: 20,
                  color: theme.brightness == Brightness.dark
                      ? CustomColor.instagramBlack
                      : Colors.grey,
                ),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
