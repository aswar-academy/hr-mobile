import 'package:aswar/common_libs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale("en"));

  void changeLanguage(Locale locale) {
    emit(locale);
  }
}
