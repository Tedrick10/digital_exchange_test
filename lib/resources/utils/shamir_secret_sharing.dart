// ignore_for_file: avoid_print

// Flutter: External Libraries
import 'package:ntcdcrypto/ntcdcrypto.dart';

// ShamirSecretSharing
class ShamirSecretSharing {
  // Final: Class Properties
  final String randomString;
  final SSS sss = SSS();

  // Constructor
  ShamirSecretSharing(this.randomString);

  // Changable: Class Properties
  List<String> _secretSharesListWithBase64 = [];
  List<String> _secretSharesListWithHex = [];
  String _seed001 = "";
  String _seed002 = "";
  String _seed003 = "";

  // Getters: Class Methods
  List<String> get getSecretSharesListWithBase64 => _secretSharesListWithBase64;
  List<String> get getSecretSharesListWithHex => _secretSharesListWithHex;
  String get getSeed001 => _seed001;
  String get getSeed002 => _seed002;
  String get getSeed003 => _seed003;

  // Action: Class Methods
  void generateSecretSharesListWithBase64() {
    _secretSharesListWithBase64 = sss.create(2, 3, randomString, true);

    _seed001 = _secretSharesListWithBase64[0];
    _seed002 = _secretSharesListWithBase64[1];
    _seed003 = _secretSharesListWithBase64[2];
  }

  void generateSecretSharesListWithHex() {
    _secretSharesListWithHex = sss.create(2, 3, randomString, false);

    _seed001 = _secretSharesListWithHex[0];
    _seed002 = _secretSharesListWithHex[1];
    _seed003 = _secretSharesListWithHex[2];
  }

  String generateCombineSecretSharesWithBase64(List<String> secretSharesList) {
    return sss.combine(secretSharesList, true);
  }

  String generateCombineSecretSharesWithHex(List<String> secretSharesList) {
    return sss.combine(secretSharesList, false);
  }

  // Printing: Class Methods
  void getBase64Information() {
    String base64Text =
        "Secret Shares List (Base64): $_secretSharesListWithBase64";
    String base64LengthText =
        "Length of Secret Shares List (Base64): ${_secretSharesListWithBase64.length}";

    String combineSeed001PlusSeed002Text =
        "Seed001 + Seed002: ${generateCombineSecretSharesWithBase64([
          _seed001,
          _seed002,
        ])}";
    String combineSeed002PlusSeed003Text =
        "Seed002 + Seed003: ${generateCombineSecretSharesWithBase64([
          _seed002,
          _seed003,
        ])}";
    String combineSeed001PlusSeed003Text =
        "Seed001 + Seed003: ${generateCombineSecretSharesWithBase64([
          _seed001,
          _seed003,
        ])}";
    String combineAllSeedsText =
        "All Seeds: ${generateCombineSecretSharesWithBase64(_secretSharesListWithBase64)}";

    String headerAndFooter = "----- ShamirSecretSharing(Base64) -----";

    String combineText = """
    \n
      $headerAndFooter
      $base64Text
      $base64LengthText
      $combineSeed001PlusSeed002Text
      $combineSeed002PlusSeed003Text
      $combineSeed001PlusSeed003Text
      $combineAllSeedsText
      $headerAndFooter
    \n
    """;

    print(combineText);
  }

  void getHexInformation() {
    String hexText = "Secret Shares List (Hex): $_secretSharesListWithHex";
    String hexLengthText =
        "Length of Secret Shares List (Hex): ${_secretSharesListWithHex.length}";

    String combineSeed001PlusSeed002Text =
        "Seed001 + Seed002: ${generateCombineSecretSharesWithHex([
          _seed001,
          _seed002,
        ])}";
    String combineSeed002PlusSeed003Text =
        "Seed002 + Seed003: ${generateCombineSecretSharesWithHex([
          _seed002,
          _seed003,
        ])}";
    String combineSeed001PlusSeed003Text =
        "Seed001 + Seed003: ${generateCombineSecretSharesWithHex([
          _seed001,
          _seed003,
        ])}";
    String combineAllSeedsText =
        "All Seeds: ${generateCombineSecretSharesWithHex(_secretSharesListWithHex)}";

    String headerAndFooter = "----- ShamirSecretSharing(Hex) -----";

    String combineText = """
    \n
      $headerAndFooter
      $hexText
      $hexLengthText
      $combineSeed001PlusSeed002Text
      $combineSeed002PlusSeed003Text
      $combineSeed001PlusSeed003Text
      $combineAllSeedsText
      $headerAndFooter
    \n
    """;

    print(combineText);
  }

  void getAllInformation() {
    String base64Text =
        "Secret Shares List (Base64): $_secretSharesListWithBase64";
    String base64LengthText =
        "Length of Secret Shares List (Base64): ${_secretSharesListWithBase64.length}";

    String hexText = "Secret Shares List (Hex): $_secretSharesListWithHex";
    String hexLengthText =
        "Length of Secret Shares List (Hex): ${_secretSharesListWithHex.length}";

    String headerAndFooter = "----- ShamirSecretSharing -----";

    String combineText = """
    \n
      $headerAndFooter
      $base64Text
      $base64LengthText
      $hexText
      $hexLengthText
      $headerAndFooter
    \n
    """;

    print(combineText);
  }
}
