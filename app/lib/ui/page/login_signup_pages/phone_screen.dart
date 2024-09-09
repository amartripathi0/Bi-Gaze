import 'dart:developer';

import 'package:bigaze/services/firebase_auth_methods.dart';
import 'package:bigaze/widgets/custom_button.dart';
import 'package:bigaze/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = '/phone';
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();
  String _selectedCountryCode = '+91'; // Default country code

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  bool isValidPhoneNumber(String phoneNumber) {
    // Simple regex validation for phone numbers (adjust for different countries if needed)
    final validPhoneRegex = RegExp(r'^[0-9]{9,15}$');
    return validPhoneRegex.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Phone Authentication',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            // Country Code Picker
            Row(
              children: [
                CountryCodePicker(
                  onChanged: (code) {
                    setState(() {
                      _selectedCountryCode = code.dialCode!;
                    });
                  },
                  initialSelection: 'IN', // Default to US
                  favorite: const [
                    '+91',
                    'IN'
                  ], // Add your preferred countries here
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: CustomPhoneTextField(
                    controller: phoneController,
                    hintText: 'Enter phone number',
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                String fullPhoneNumber =
                    '$_selectedCountryCode${phoneController.text}';
                log(_selectedCountryCode);
                if (isValidPhoneNumber(phoneController.text)) {
                  context
                      .read<FirebaseAuthMethods>()
                      .phoneSignIn(context, fullPhoneNumber);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter a valid phone number')),
                  );
                }
              },
              text: 'Verify',
            ),
          ],
        ),
      ),
    );
  }
}
