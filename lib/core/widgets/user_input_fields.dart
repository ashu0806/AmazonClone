import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInputField extends StatelessWidget {
  const UserInputField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.h,
      ),
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
        cursorHeight: 20.sp,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(
            20.sm,
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your $hintText';
          }
          return null;
        },
      ),
    );
  }
}
