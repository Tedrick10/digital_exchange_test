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
    // Step 001: Generating a random number/seed (Success)
    GeneratedRandomString generatedRandomString = GeneratedRandomString();

    generatedRandomString.generateCryptoRandomStringWithBase64();
    generatedRandomString.generateCryptoRandomStringWithHex();

    generatedRandomString.getBase64Information();
    generatedRandomString.getHexInformation();

    String randomStringBase64 = generatedRandomString.getEncodedBase64UrlString;
    String randomStringHex = generatedRandomString.getEncodedHexString;

    // Step 002: Split seed into 3 parts using Shamir Secret Sharing Algorithm (Success)
    /* Shamir Secret Sharing (Base64) */
    ShamirSecretSharing shamirSecretSharingBase64 =
        ShamirSecretSharing(randomStringBase64);
    shamirSecretSharingBase64.generateSecretSharesListWithBase64();
    shamirSecretSharingBase64.getBase64Information();
    List<String> secretSharesListWithBase64 =
        shamirSecretSharingBase64.getSecretSharesListWithBase64;

    /* Shamir Secret Sharing (Hex) */
    ShamirSecretSharing shamirSecretSharingHex =
        ShamirSecretSharing(randomStringHex);
    shamirSecretSharingHex.generateSecretSharesListWithHex();
    shamirSecretSharingHex.getHexInformation();
    List<String> secretSharesListWithHex =
        shamirSecretSharingHex.getSecretSharesListWithHex;

    // Step 003: Generate root Private Keys for btc and eth using HD Wallet
    HDWallet hdWalletForBase64 = HDWallet(randomStringBase64, "Base 64");
    // hdWalletForBase64.generatedFromBase58();
    hdWalletForBase64.generatedFromSeed();
    hdWalletForBase64.getAllInformation();

    HDWallet hdWalletForHex = HDWallet(randomStringHex, "Hex");
    // hdWalletForHex.generatedFromBase58();
    hdWalletForHex.generatedFromSeed();
    hdWalletForHex.getAllInformation();

    // ECIES
    SVPrivateKey svPrivateKey = SVPrivateKey.fromHex(
      hdWalletForHex.getPrivateKeyFromSeed,
      NetworkType.MAIN,
    );
    SVPublicKey svPublicKey = SVPublicKey.fromPrivateKey(svPrivateKey);
    print("SVPrivateKey: $svPrivateKey");
    print("SVPublicKey: $svPublicKey");

    List<int> list = randomStringHex.codeUnits;
    Uint8List bytes = Uint8List.fromList(list);
    List<int> eciesEncryptFromHex = Ecies().AESEncrypt(
      bytes,
      svPrivateKey,
      svPublicKey,
    );
    print("ECIES Encryption From Random String (HEX): $eciesEncryptFromHex");

    Uint8List cipherText = Uint8List.fromList(eciesEncryptFromHex);
    List<int> eciesDecryptFromHex = Ecies().AESDecrypt(
      cipherText,
      svPrivateKey,
    );
    print("ECIES Decryption From Random String (HEX): $eciesDecryptFromHex");

    String encodedDecryptedText = HEX.encode(eciesEncryptFromHex);
    print("Encoded Decrypted Text: $encodedDecryptedText");

    String encodedOriginalString = HEX.encode(list);
    print("Encoded Original String: $encodedOriginalString");

    // Alternatives
    // - node rsa (javascript)
    // - encryptjs (javascript)

    // spy ski prefer box major horn uncle soldier ramp initial ring flower

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
