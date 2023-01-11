import 'package:flutter/material.dart';

// const kPrimColor = Color(0xFFFF7643);
// const kPrimLightColor = Color(0xFFFFECDF);
// const kprimGradColor = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
// );
// const kSecondColor = Color(0xFF979797);
// const kTextColor = Color(0xFFFFFFFF);

const kAnimationDuration = Duration(milliseconds: 200);

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Color(0xffffffff)),
  );
}
