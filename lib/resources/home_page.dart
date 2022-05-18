// Dart: Existing Libraries
import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:hex/hex.dart';

// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:ntcdcrypto/ntcdcrypto.dart';
import 'package:bip32/bip32.dart' as bip32;
import 'package:dartsv/dartsv.dart';
import 'package:dartsv/dartsv.dart';

// Utilities
import './utils/generated_random_string.dart';
import './utils/shamir_secret_sharing.dart';
import './utils/hd_wallet.dart';

// HomePage: StatelessWidget Class
class HomePage extends StatelessWidget {
  // Static: Class Properties
  static const String title = "Home Page";
  static const String routeName = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Alternatives
    // - node rsa (javascript)
    // - encryptjs (javascript)

    // spy ski prefer box major horn uncle soldier ramp initial ring flower

    // Step 001: Generating random number/seed
    GeneratedRandomString generatedRandomString = GeneratedRandomString();
    generatedRandomString.generateCryptoRandomStringWithBase64();
    generatedRandomString.generateCryptoRandomStringWithHex();

    String base64String = generatedRandomString.getEncodedBase64UrlString;
    String hexString = generatedRandomString.getEncodedHexString;

    // Step 002: Split seed into 3 parts using SSS Algorithm

    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("This is $title."),
        ),
      ),
    );
  }
}
