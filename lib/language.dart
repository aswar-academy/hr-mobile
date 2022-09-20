import 'package:aswar/common_libs.dart';
import 'package:aswar/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// TODO(masreplay): replace with settingCubit

@injectable
class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale($language.getData() ?? "en"));

  Future<void> changeLanguage() async {
    final newValue = state.countryCode == "ar" ? "ar" : "ar";
    print(newValue);
    await $language.setData(newValue);
    emit(Locale(newValue));
  }
}
