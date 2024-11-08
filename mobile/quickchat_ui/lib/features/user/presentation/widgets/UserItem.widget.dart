// ignore_for_file: depend_on_referenced_packages

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    super.key,
    required this.name,
    required this.username,
    required this.onTap,
    required this.ontapMessage,
    this.isLoading,
  });

  final String name;
  final String username;
  final Function() onTap;
  final Function() ontapMessage;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
                onTap: () {
                  onTap();
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Text(
                    username.split('')[0].toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                title: Text(
                  toBeginningOfSentenceCase(name),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(username),
                trailing: SizedBox(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          const snackBar = SnackBar(
                            content: Text('Feature not yet available'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Icon(
                          FluentIcons.people_12_regular,
                          color: Colors.redAccent,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ontapMessage();
                        },
                        child: const Icon(
                          FluentIcons.chat_12_regular,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Visibility(
          visible: isLoading ?? false,
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
