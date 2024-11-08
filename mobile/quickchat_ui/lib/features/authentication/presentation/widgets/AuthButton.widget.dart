import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickchat_ui/core/utils/custom_color.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({
    super.key,
    required this.buttonwidth,
    required this.isLoading,
    required this.action,
    required this.bgColor,
    required this.buttonName,
  });

  final double buttonwidth;
  final bool isLoading;
  final String buttonName;
  final Color bgColor;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: buttonwidth,
      child: ElevatedButton(
        onPressed: () {
          action();
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              return bgColor;

              //  Color(0xFF3897F0);
            },
          ),
        ),
        child: isLoading
            ? const CupertinoActivityIndicator(
                color: Colors.black,
              )
            : Text(
                buttonName,
                style: const TextStyle(
                  color: CustomColor.instagramWhite,
                  fontSize: 14.0,
                ),
              ),
      ),
    );
  }
}
