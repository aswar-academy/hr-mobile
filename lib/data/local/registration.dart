import 'dart:async';
import 'dart:convert';

import 'package:aswar/common_libs.dart';
import 'package:aswar/data/local/preferences.dart';
import 'package:aswar/data/local/utils/base.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class RegistrationPreference extends ObjectSharedPreference<Registration> {
  const RegistrationPreference(super.sharedPreference)
      : super(key: Preferences.registration);

  @override
  Future<void> setData(Registration value) async {
    await sharedPreference.setString(key, json.encode(value.toJson()));
  }

  @override
  Registration? getData() {
    final value = sharedPreference.getString(key);
    return value == null ? null : Registration.fromJson(json.decode(value));
  }
}
