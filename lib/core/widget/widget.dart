import 'package:flutter/material.dart';
import 'package:ostello/core/color/color.dart';
import 'package:ostello/core/constant/constant.dart';
import 'package:ostello/presentation/onboard%20screen/functions/fun_onboard.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixicon,
    this.suffixOnpress,
    this.obscurebool = false,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.suffixIconColor,
    this.readOnly = false,
  });
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final IconData? suffixicon;
  final void Function()? suffixOnpress;
  final void Function(String?)? onChanged;
  final bool obscurebool;
  final Color? suffixIconColor;
  final bool readOnly;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: const TextStyle(color: colorBlack),
      onChanged: onChanged,
      obscureText: obscurebool,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: suffixOnpress,
          icon: Icon(
            suffixicon,
            color: suffixIconColor,
          ),
        ),
        prefixIcon: prefixIcon,
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: validator,
    );
  }
}
//============================================ElevatedBtn=========================================================

class ElevatedBtnWidget extends StatelessWidget {
  const ElevatedBtnWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.btnColor,
    this.borderColor,
    this.leading,
  });
  final void Function()? onPressed;
  final String title;
  final Color? btnColor;
  final Color? borderColor;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        backgroundColor: btnColor ?? Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leading ?? Container(),
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class TextFieldWithText extends StatelessWidget {
  const TextFieldWithText({
    super.key,
    required this.title,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.onChanged,
    this.suffixicon,
    this.suffixIconColor,
    this.keyboardType,
    this.readOnly = false,
  });
  final String title;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final IconData? suffixicon;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 19, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 10),
        TextFormWidget(
          keyboardType: keyboardType,
          readOnly: readOnly,
          onChanged: onChanged,
          label: title,
          hintText: hintText,
          prefixIcon: prefixIcon,
          controller: controller,
          validator: validator,
          suffixIconColor: suffixIconColor,
          suffixicon: suffixicon,
        ),
      ],
    );
  }
}

class DropDownWidgetWithText extends StatelessWidget {
  const DropDownWidgetWithText({
    super.key,
    required this.dropdownValueNoti,
    required this.items,
    required this.hintTxt,
    required this.label,
  });

  final ValueNotifier<String?> dropdownValueNoti;
  final List<String> items;
  final String hintTxt;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 19, color: Colors.grey.shade700),
        ),
        sizedBox10H,
        DropdownButtonFormField<String>(
          hint: Text(hintTxt),
          value: dropdownValueNoti.value,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onChanged: (String? newValue) {
            dropdownValueNoti.value = newValue!;
            chooseFN(label, dropdownValueNoti.value!);
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class RadioWidget extends StatelessWidget {
  final String title;
  final String? groupvalue;
  final void Function(String?)? onChanged;
  const RadioWidget(
      {super.key,
      required this.title,
      this.groupvalue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: title,
          groupValue: groupvalue,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 17),
        )
      ],
    );
  }
}
