// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:ostello/value_notifier/value_notifier.dart';

void validatePhone(String val) {
  if (val.trim().length == 10 && val.isNum) {
    phoneNoValueNotifier.value = true;
    chooseFN('phone', val);
  } else if (val.isEmpty) {
    phoneNoValueNotifier.value = null;
    linearBarValuenotifier.value.remove('phone');
    linearBarValuenotifier.notifyListeners();
  } else {
    phoneNoValueNotifier.value = false;
    linearBarValuenotifier.value.remove('phone');
    linearBarValuenotifier.notifyListeners();
  }
}

void validateName(String val) {
  if (val.trim().length > 3 && RegExp('[a-zA-Z]').hasMatch(val)) {
    fullNameValueNotifier.value = true;
    chooseFN('name', val);
  } else if (val.isEmpty) {
    linearBarValuenotifier.value.remove('name');
    linearBarValuenotifier.notifyListeners();
    fullNameValueNotifier.value = null;
  } else {
    fullNameValueNotifier.value = false;
    linearBarValuenotifier.value.remove('name');
    linearBarValuenotifier.notifyListeners();
  }
}

void chooseFN(String key, dynamic value) {
  linearBarValuenotifier.value[key] = value;
  linearBarValuenotifier.notifyListeners();
}
