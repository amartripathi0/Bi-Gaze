import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white, // White border color
            width: 2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.cyan
                  .withOpacity(0.6), // Cyan shadow color with opacity
              spreadRadius: 3, // Spreads the shadow to create a glowing effect
              blurRadius: 10, // Softens the shadow
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white), // White text color
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: Color.fromARGB(0, 0, 0, 0), width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            fillColor: const Color.fromARGB(
                172, 0, 0, 0), // Semi-transparent background
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(
                  120, 255, 255, 255), // Lighter white for the hint text
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const CustomPasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white, // White border color
            width: 2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.cyan
                  .withOpacity(0.6), // Cyan shadow color with opacity
              spreadRadius: 3, // Spreads the shadow to create a glowing effect
              blurRadius: 10, // Softens the shadow
            ),
          ],
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          style: const TextStyle(color: Colors.white), // White text color
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Color.fromARGB(209, 212, 255, 182), width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 177, 255, 157), width: 0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            fillColor: const Color.fromARGB(
                172, 0, 0, 0), // Semi-transparent background
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(
                  120, 255, 255, 255), // Lighter white for the hint text
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white54,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class CustomPhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType; // Add this to allow keyboard type changes
  final List<TextInputFormatter>?
      inputFormatters; // Add this for input formatting

  const CustomPhoneTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType, // Initialize the keyboard type
    this.inputFormatters, // Initialize the input formatters
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white, // White border color
            width: 2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.cyan
                  .withOpacity(0.6), // Cyan shadow color with opacity
              spreadRadius: 3, // Spreads the shadow to create a glowing effect
              blurRadius: 10, // Softens the shadow
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType, // Use the keyboard type
          inputFormatters: inputFormatters, // Add input formatters here
          style: const TextStyle(color: Colors.white), // White text color
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            fillColor: const Color.fromARGB(
                172, 0, 0, 0), // Semi-transparent background
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(
                  120, 255, 255, 255), // Lighter white for hint text
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
