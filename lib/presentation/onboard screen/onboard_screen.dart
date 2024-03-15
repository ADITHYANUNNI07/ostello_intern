// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostello/core/color/color.dart';
import 'package:ostello/core/constant/constant.dart';
import 'package:ostello/core/widget/widget.dart';
import 'package:ostello/presentation/onboard%20screen/functions/fun_onboard.dart';
import 'package:ostello/value_notifier/value_notifier.dart';

class OnboardScrn extends StatelessWidget {
  const OnboardScrn({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorWhite,
      child: SafeArea(
          child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Let’s Onboard You!',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: Get.width * 0.2,
                        child: ValueListenableBuilder(
                          valueListenable: linearBarValuenotifier,
                          builder: (context, linear, _) => Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: LinearProgressIndicator(
                                  minHeight: 35,
                                  backgroundColor: colorApp.withOpacity(0.1),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          colorApp),
                                  value: linear.length * 0.146,
                                ),
                              ),
                              Positioned(
                                child: Row(
                                  children: [
                                    Image.asset(imageLinearPro, width: 35),
                                    Text('${linear.length}/7',
                                        style: const TextStyle(
                                            color: colorWhite,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizedBox10H,
                  SizedBox(
                    width: Get.width * 0.3,
                    child: LinearProgressIndicator(
                      minHeight: 4,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
            sizedBox15H,
            Container(
              color: colorWhite,
              width: Get.width,
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: fullNameValueNotifier,
                    builder: (context, isName, _) => TextFieldWithText(
                      title: 'Full Name',
                      hintText: 'Eg. Alex K',
                      suffixicon: isName == null
                          ? null
                          : isName == false
                              ? Icons.cancel
                              : Icons.check_circle,
                      suffixIconColor: isName == null
                          ? null
                          : isName == false
                              ? Colors.redAccent
                              : Colors.green,
                      onChanged: (value) {
                        validateName(value!);
                      },
                    ),
                  ),
                  sizedBox15H,
                  ValueListenableBuilder(
                      valueListenable: phoneNoValueNotifier,
                      builder: (context, isPhone, _) => TextFieldWithText(
                            keyboardType: TextInputType.phone,
                            title: 'Phone Number',
                            hintText: 'Eg. 9087641811',
                            onChanged: (value) {
                              validatePhone(value!);
                            },
                            suffixicon: isPhone == null
                                ? null
                                : isPhone == false
                                    ? Icons.cancel
                                    : Icons.check_circle,
                            suffixIconColor: isPhone == null
                                ? null
                                : isPhone == false
                                    ? Colors.redAccent
                                    : Colors.green,
                            prefixIcon: SizedBox(
                              width: Get.width * 0.28,
                              child: Row(
                                children: [
                                  sizedBox15W,
                                  Image.asset('assets/images/india.png',
                                      width: 40),
                                  sizedBox5W,
                                  const Text(
                                    '+91',
                                    style: TextStyle(fontSize: 19),
                                  )
                                ],
                              ),
                            ),
                          )),
                  sizedBox15H,
                  ValueListenableBuilder(
                    valueListenable: classNoti,
                    builder: (context, dropdownValue, _) {
                      return DropDownWidgetWithText(
                          label: 'Select Class',
                          hintTxt: 'Please Select your Class',
                          items: List.generate(
                              10, (index) => 'Class ${index + 1}'),
                          dropdownValueNoti: classNoti);
                    },
                  ),
                  sizedBox15H,
                  ValueListenableBuilder(
                      valueListenable: streamNoti,
                      builder: (context, dropdownValue, _) =>
                          DropDownWidgetWithText(
                              label: 'Select Stream',
                              hintTxt: 'Please Select your Stream',
                              items: const ['Computer', 'Science', 'Commerce'],
                              dropdownValueNoti: streamNoti)),
                  sizedBox15H,
                  Text(
                    'Choose subjects that you have',
                    style: TextStyle(fontSize: 19, color: Colors.grey.shade700),
                  ),
                  sizedBox10H,
                  ValueListenableBuilder(
                    valueListenable: isExpandNoti,
                    builder: (context, isExpand, _) => InkWell(
                      onTap: () {
                        isExpandNoti.value = !isExpand;
                      },
                      child: Container(
                        padding: isExpand
                            ? const EdgeInsets.all(20)
                            : const EdgeInsets.only(left: 15),
                        height: isExpand ? null : 60,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: streamNoti,
                              builder: (context, dropdownValue, _) => Text(
                                dropdownValue ?? '',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            isExpand
                                ? ValueListenableBuilder(
                                    valueListenable: isUnSelectedListNoti,
                                    builder: (context, unselectedlist, _) {
                                      return ValueListenableBuilder(
                                          valueListenable: isSelectedListNoti,
                                          builder:
                                              (context, selectedlist, _) =>
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Divider(),
                                                      Visibility(
                                                          visible: selectedlist
                                                              .isNotEmpty,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                  'Selected Subjects',
                                                                  style: TextStyle(
                                                                      color:
                                                                          colorApp)),
                                                              Column(
                                                                children: List
                                                                    .generate(
                                                                  selectedlist
                                                                      .length,
                                                                  (index) =>
                                                                      Row(
                                                                    children: [
                                                                      Text(selectedlist[
                                                                          index]),
                                                                      const Spacer(),
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            isUnSelectedListNoti.value.add(selectedlist[index]);
                                                                            isSelectedListNoti.value.removeAt(index);
                                                                            isUnSelectedListNoti.notifyListeners();
                                                                            if (isUnSelectedListNoti.value.isEmpty) {
                                                                              linearBarValuenotifier.value.remove('subject');
                                                                            }
                                                                          },
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.remove_circle_outline_outlined,
                                                                            color:
                                                                                colorRed,
                                                                          ))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              const Divider(),
                                                              const Text(
                                                                'Unselected Subjects',
                                                                style: TextStyle(
                                                                    color:
                                                                        colorApp),
                                                              ),
                                                            ],
                                                          )),
                                                      Column(
                                                        children: List.generate(
                                                            unselectedlist
                                                                .length,
                                                            (index) => Row(
                                                                  children: [
                                                                    Text(unselectedlist[
                                                                        index]),
                                                                    const Spacer(),
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          chooseFN(
                                                                              'subject',
                                                                              selectedlist);
                                                                          isSelectedListNoti
                                                                              .value
                                                                              .add(unselectedlist[index]);
                                                                          isUnSelectedListNoti
                                                                              .value
                                                                              .removeAt(index);
                                                                          isUnSelectedListNoti
                                                                              .notifyListeners();
                                                                        },
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .add_box_outlined,
                                                                          color:
                                                                              colorGreen,
                                                                        ))
                                                                  ],
                                                                )),
                                                      ),
                                                    ],
                                                  ));
                                    })
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  sizedBox15H,
                  ValueListenableBuilder(
                    valueListenable: schoolNoti,
                    builder: (context, dropdownValue, _) {
                      return DropDownWidgetWithText(
                          label: 'Select School',
                          hintTxt: 'Please Select your School',
                          items: const [
                            'Govt Science School',
                            'Delhi Public School, Pitmampura'
                          ],
                          dropdownValueNoti: schoolNoti);
                    },
                  ),
                  sizedBox15H,
                  ValueListenableBuilder(
                    valueListenable: genderNoti,
                    builder: (context, selectedGender, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                              fontSize: 19, color: Colors.grey.shade700),
                        ),
                        sizedBox10H,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RadioWidget(
                              title: 'Male',
                              groupvalue: selectedGender,
                              onChanged: (value) {
                                genderNoti.value = value;
                                chooseFN('gender', value!);
                              },
                            ),
                            RadioWidget(
                              title: 'Female',
                              groupvalue: selectedGender,
                              onChanged: (value) {
                                genderNoti.value = value;
                                chooseFN('gender', value!);
                              },
                            ),
                            RadioWidget(
                              title: 'Other',
                              groupvalue: selectedGender,
                              onChanged: (value) {
                                genderNoti.value = value;
                                chooseFN('gender', value!);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  sizedBox15H,
                  TextFieldWithText(
                    title: 'Referral Code (optional)',
                    onChanged: (value) {},
                  ),
                  sizedBox15H,
                  ValueListenableBuilder(
                    valueListenable: checkBoxNoti,
                    builder: (context, ischeck, child) => Row(
                      children: [
                        Checkbox(
                          value: ischeck,
                          onChanged: (value) {
                            checkBoxNoti.value = !ischeck;
                          },
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'By creating an account, you aggree to our',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              'Term and Conditions',
                              style: TextStyle(color: colorApp, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ElevatedBtnWidget(
                    onPressed: () {},
                    title: 'Create account',
                    btnColor: colorApp,
                  ),
                  sizedBox5H,
                  const Align(
                    child: Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: colorApp,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
