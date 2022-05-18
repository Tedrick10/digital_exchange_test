// Flutter: External Libraries
import 'dart:typed_data';

import 'package:bip32/bip32.dart' as bip32;
import 'package:hex/hex.dart';

// HDWallet: Utility Class
class HDWallet {
  // Final: Class Properties
  final String randomString;
  final String type;

  // Changable: Class Properties
  String _publicKeyFromBase58 = "";
  String _privateKeyFromBase58 = "";
  String _publicKeyFromSeed = "";
  String _privateKeyFromSeed = "";

  // Constructor
  HDWallet(
    this.randomString,
    this.type,
  );

  // Getters: Class Methods
  String get getPublicKeyFromBase58 => _publicKeyFromBase58;
  String get getPrivateKeyFromBase58 => _privateKeyFromBase58;
  String get getPublicKeyFromSeed => _publicKeyFromSeed;
  String get getPrivateKeyFromSeed => _privateKeyFromSeed;

  // Action: Class Methods
  void generatedFromBase58() {
    bip32.BIP32 node = bip32.BIP32.fromBase58(randomString);
    _publicKeyFromBase58 = HEX.encode(node.publicKey);
    _privateKeyFromBase58 = HEX.encode(node.privateKey!);
  }

  void generatedFromSeed() {
    List<int> list = randomString.codeUnits;
    Uint8List bytes = Uint8List.fromList(list);

    bip32.BIP32 node = bip32.BIP32.fromSeed(bytes);

    _publicKeyFromSeed = HEX.encode(node.publicKey);
    _privateKeyFromSeed = HEX.encode(node.privateKey!);
  }

  void getAllInformation() {
    String publicKeyFromBase58Text =
        "Public Key (Base58): $_publicKeyFromBase58";
    String _privateKeyFromBase58Text =
        "Private Key (Base58): $_privateKeyFromBase58";

    String _publicKeyFromSeedText = "Public Key (Seed): $_publicKeyFromSeed";
    String _privateKeyFromSeedText = "Private Key (Seed): $_privateKeyFromSeed";

    String headerAndFooterText = "----- HD Wallet ($type)-----";

    String combineText = """
     \n
       $headerAndFooterText
       $_publicKeyFromSeedText
       $_privateKeyFromSeedText
       $headerAndFooterText
     \n
     """;

    print(combineText);
  }
}
