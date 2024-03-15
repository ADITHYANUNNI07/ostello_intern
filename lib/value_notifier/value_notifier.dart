import 'package:flutter/material.dart';

ValueNotifier<bool?> phoneNoValueNotifier = ValueNotifier<bool?>(null);
ValueNotifier<String?> classNoti = ValueNotifier(null);
ValueNotifier<String?> streamNoti = ValueNotifier(null);
ValueNotifier<String?> schoolNoti = ValueNotifier(null);
ValueNotifier<String?> genderNoti = ValueNotifier(null);
ValueNotifier<bool> checkBoxNoti = ValueNotifier(false);
ValueNotifier<bool?> fullNameValueNotifier = ValueNotifier<bool?>(null);
ValueNotifier<bool> isExpandNoti = ValueNotifier(false);
ValueNotifier<List<String>> isUnSelectedListNoti =
    ValueNotifier(List.generate(10, (index) => 'Subject ${index + 1}'));
ValueNotifier<List<String>> isSelectedListNoti = ValueNotifier([]);
ValueNotifier<Map<String, dynamic>> linearBarValuenotifier = ValueNotifier({});
