// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

class TypingTextAnimation extends StatefulWidget {
  final List<String> texts;
  final TextStyle textStyle;
  final bool showCursor;

  const TypingTextAnimation({
    super.key,
    required this.texts,
    this.textStyle = const TextStyle(),
    this.showCursor = true,
  });

  @override
  _TypingTextAnimationState createState() => _TypingTextAnimationState();
}

class _TypingTextAnimationState extends State<TypingTextAnimation> {
  int _currentIndex = 0;
  String _currentText = '';
  late Timer _timer;
  final int maxCharactersPerLine = 21; // Maximum characters per line

  @override
  void initState() {
    super.initState();
    _currentText = widget.texts[_currentIndex];
    _startTypingAnimation();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTypingAnimation() {
    const duration = Duration(milliseconds: 50); // Adjust typing speed
    int charIndex = 0;
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (_currentIndex < widget.texts.length) {
          String currentText = widget.texts[_currentIndex];
          if (charIndex < currentText.length) {
            _currentText = currentText.substring(0, charIndex + 1);
            charIndex++;
          } else {
            charIndex = 0;
            _timer.cancel();
            _startNextTextAnimation();
          }
        }
      });
    });
  }

  void _startNextTextAnimation() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.texts.length;
      _timer = Timer(const Duration(milliseconds: 1500), () {
        _startTypingAnimation();
      });
    });
  }

  List<String> _splitText(String text) {
    List<String> lines = [];
    for (int i = 0; i < text.length; i += maxCharactersPerLine) {
      if (i + maxCharactersPerLine <= text.length) {
        lines.add(text.substring(i, i + maxCharactersPerLine));
      } else {
        lines.add(text.substring(i));
      }
    }
    return lines;
  }

  @override
  Widget build(BuildContext context) {
    List<String> lines = _splitText(_currentText);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              line,
              style: widget.textStyle,
            ),
            if (widget.showCursor && line == lines.last)
              const SizedBox(
                width: 8, // Adjust cursor width as needed
                child: Text("|", style: TextStyle(color: Colors.black)),
              ),
          ],
        );
      }).toList(),
    );
  }
}
