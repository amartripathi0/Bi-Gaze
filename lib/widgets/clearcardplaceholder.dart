import 'package:flutter/material.dart';

class ClearCardPlaceholder extends StatelessWidget {
  final Widget child;

  const ClearCardPlaceholder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(1)),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(219, 255, 255, 255)),
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(104, 103, 101, 101),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const SizedBox(width: 16),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: child, // Embedding the child widget here
              ),
            ),
          ],
        ),
      ),
    );
  }
}
