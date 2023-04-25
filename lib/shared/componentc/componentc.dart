import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget DefoltFormField({
  required TextEditingController controller,
  var validator,
  var validate,
  required String label,
  var prifixIcon,
  var suffixIcon,
  var suffixPress,
  var OnTap,
  var onChanged,
  var type,
  bool isPassword=false,
  bool isClickabld =true,
   IconData? prifix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickabld,
      validator: validator,
      onTap: OnTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefix: Icon(
          prifixIcon,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          onPressed: suffixPress,
          icon: Icon(suffixIcon),color: Colors.pink,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 1,
          ),
        ),
      ),
    );

void navigaateTo(context,Widget)=>Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=>Widget,
  ),
);
void navigaateAndFinish(context,Widget)=>Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context)=>Widget,
  ),
);

