// ignore_for_file: avoid_print

// Dart: Existing Libraries
import 'dart:convert';
import 'dart:math';

// Dart: External Libraries
import 'package:convert/convert.dart';

// GeneratedRandomString
class GeneratedRandomString {
  // Final: Class Properties
  final Random _random = Random.secure();

  // Normal: Class Properties
  String _encodedBase64UrlString = "";
  String _encodedHexString = "";

  // Getter: Class Methods
  String get getEncodedBase64UrlString => _encodedBase64UrlString;

  String get getEncodedHexString => _encodedHexString;

  // Action: Class Methods
  void generateCryptoRandomStringWithBase64() {
    List<int> values = List<int>.generate(32, (i) => _random.nextInt(256));
    _encodedBase64UrlString = base64Url.encode(values);
  }

  void generateCryptoRandomStringWithHex() {
    List<int> values = List<int>.generate(32, (i) => _random.nextInt(256));
    _encodedHexString = hex.encode(values);
  }

  // Printing: Class Methods
  void getBase64Information() {
    String base64StringText = "Base64 String: $_encodedBase64UrlString";
    String base64StringLengthText =
        "Length of Base64 String: ${_encodedBase64UrlString.length}";

    String headerAndFooter = "----- GeneratedRandomString(Base64) -----";

    String combineString = """
    \n
      $headerAndFooter
      $base64StringText
      $base64StringLengthText
      $headerAndFooter
    \n
    """;

    print(combineString);
  }

  void getHexInformation() {
    String hexStringText = "Hex String: $_encodedHexString";
    String hexStringLengthText =
        "Length of Hex String: ${_encodedHexString.length}";

    String headerAndFooter = "----- GeneratedRandomString(Hex) -----";

    String combineString = """
    \n
      $headerAndFooter
      $hexStringText
      $hexStringLengthText
      $headerAndFooter
    \n
    """;

    print(combineString);
  }

  void getAllInformation() {
    String base64StringText = "Base64 String: $_encodedBase64UrlString";
    String base64StringLengthText =
        "Length of Base64 String: ${_encodedBase64UrlString.length}";

    String hexStringText = "Hex String: $_encodedHexString";
    String hexStringLengthText =
        "Length of Hex String: ${_encodedHexString.length}";

    String headerAndFooter = "----- GeneratedRandomString -----";

    String combineString = """
    \n
      $headerAndFooter
      $base64StringText
      $base64StringLengthText
      $hexStringText
      $hexStringLengthText
      $headerAndFooter
    \n
    """;

    print(combineString);
  }
}
