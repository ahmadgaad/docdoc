import 'package:docdoc/core/extensions/navigation.dart';
import 'package:docdoc/core/themes/styles.dart';
import 'package:flutter/material.dart';

void showCustomError(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Ok",
              style: TextStyles.font14BlueSemiBold,
            ),
          )
        ],
      );
    },
  );
}
