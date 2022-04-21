// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:crypto_wallet/app/app.dart';
import 'package:crypto_wallet/bootstrap.dart';
import 'package:crypto_wallet/data/repositories/repositories.dart';
import 'package:cryptography_flutter/cryptography_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  const storage = FlutterSecureStorage();
  FlutterCryptography.enable();
  bootstrap(
    () => App(
      phraseRepository: PhraseRepositoryImpl(storage: storage),
    ),
  );
}
