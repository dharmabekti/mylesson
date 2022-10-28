// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_nullable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mylesson/core/validation.dart';
import '../../core/app_colors.dart';

// FormTextFieldWidget
class FormTextFieldWidget extends StatelessWidget {
  final String title, hintText;
  final String? validation;
  final TextEditingController controller;

  const FormTextFieldWidget(
      {Key? key,
      required this.title,
      required this.controller,
      required this.hintText,
      this.validation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
          controller: controller,
          validator: (value) {
            Validation().check(validation);
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              hintText: hintText,
              labelText: title,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)))),
    );
  }
}

// FormDropdownField
class FormDropdownField extends StatelessWidget {
  final String title, hintText, validation;
  final List listValue;
  final TextEditingController controller;

  const FormDropdownField(
      {Key? key,
      required this.title,
      required this.controller,
      required this.hintText,
      required this.validation,
      required this.listValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: DropdownButtonFormField(
        items: listValue.map((item) {
          return DropdownMenuItem(
            // ignore: sort_child_properties_last
            child: SizedBox(width: 250.0, child: Text(item[1].toString())),
            value: item[0].toString(),
          );
        }).toList(),
        onChanged: (value) {},
        // value: nppDosen1,
        decoration: InputDecoration(
            hintText: "Dosen Pembimbing 1",
            labelText: "Dosen Pembimbing 1",
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}
