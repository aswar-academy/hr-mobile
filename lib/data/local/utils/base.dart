import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ObjectSharedPreference<T> {
  @protected
  final String key;

  @protected
  final SharedPreferences sharedPreference;

  const ObjectSharedPreference(this.sharedPreference, {required this.key});

  T? getData();

  Future<void> setData(T value);

  Future<void> clearData() async {
    await sharedPreference.remove(key);
  }
}

class StringPreference extends ObjectSharedPreference<String> {
  const StringPreference(super.sharedPreference, {required super.key});

  @override
  String? getData() {
    return sharedPreference.getString(key);
  }

  @override
  Future<void> setData(String value) async {
    await sharedPreference.setString(key, value);
  }
}

class EnumPreference<T extends Enum> extends ObjectSharedPreference<T> {
  final List<T> values;

  const EnumPreference(
    super.sharedPreference, {
    required super.key,
    required this.values,
  });

  @override
  T? getData() {
    final value = sharedPreference.getString(key);
    if (value == null) return null;

    return values.firstWhere(
      (element) => element.name.toLowerCase() == value.toLowerCase(),
      orElse: () => values.first,
    );
  }

  @override
  Future<void> setData(Enum value) async {
    await sharedPreference.setString(key, value.name.toLowerCase());
  }

  Future<void> setString(String valueName) async {
    await sharedPreference.setString(key, valueName);
  }
}
