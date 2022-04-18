import 'package:flutter/material.dart';

void onError(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        duration: const Duration(milliseconds: 800),
        backgroundColor: Colors.red.shade100,
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                errorMessage,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )),
  );
}

void onSuccesse(BuildContext context, String successeMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        duration: const Duration(milliseconds: 800),
        backgroundColor: Colors.green.shade100,
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.done_all,
              color: Colors.green,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                successeMessage,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )),
  );
}
