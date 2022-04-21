class WalletModel {
  const WalletModel({
    this.privateKey,
    this.publicKey,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        privateKey: json['private_key'] as String?,
        publicKey: json['public_key'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'private_key': privateKey,
        'public_key': publicKey,
      };

  final String? privateKey;
  final String? publicKey;
}
