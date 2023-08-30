import 'dart:io';

import 'package:flutter/material.dart';

import 'constants.dart';

Widget defaultBottom({
  required double width,
  required double height,
  required Color background,
  required String text,
  required function,
  double radius = 15.0,
}) =>
    Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 1,
            // color: Colors.grey,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(text, style: const TextStyle(color: white, fontSize: 18.0)),
      ),
    );

Widget defaultGradientBottom({
  required double width,
  required double height,
  required Color color1,
  required Color color2,
  required String text,
  required function,
  double radius = 35.0,
}) =>
    Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color1, // Replace with your desired start color
            color2, // Replace with your desired end color
          ],
        ),
        // boxShadow: const [
        //   BoxShadow(
        //     offset: Offset(0,2),
        //     blurRadius: 1,
        //     // color: Colors.grey,
        //   ),
        // ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: transparent,
          disabledForegroundColor: transparent,
          shadowColor: transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: function,
        child: Text(text, style: const TextStyle(color: white, fontSize: 18.0)),
      ),
    );

Widget defaultElevatedButton({
  required double width,
  required double height,
  required Color color1,
  required Color color2,
  required String text,
  required function,
  double radius = 15.0,
}) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: red, // background
        foregroundColor: white, // foreground
      ),
      onPressed: function,
      child: Text(text, style: const TextStyle(color: white, fontSize: 18.0)),
    );

Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType type,
  String? label,
  TextStyle? labelStyle,
  InputBorder? border,
  InputBorder? focusedBorder,
  InputBorder? enableBorder,
  Icon? prefix,
  IconData? suffix,
  ValueChanged<String>? onSubmit,
  FormFieldValidator<String>? validate,
  ValueChanged<String>? onChange,
  bool isPassword = false,
  String? hint,
  int? maxLines,
  AutovalidateMode? autoValidateMode,
  Iterable<String>? autofillHints,
  suffixPressed,
  bool? filled,
  Color? fillColor,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: validate,
        obscureText: isPassword,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        maxLines: maxLines,
        autovalidateMode: autoValidateMode,
        enableSuggestions: true,
        autofillHints: autofillHints,
        decoration: InputDecoration(
          filled: filled,
          fillColor: fillColor,
          hintText: hint,
          labelText: label,
          labelStyle: labelStyle,
          prefixIcon: prefix,
          suffixIcon: IconButton(
            icon: Icon(
              suffix,
              color: defaultPurple,
            ),
            onPressed: suffixPressed,
          ),
          enabledBorder: enableBorder,
          focusedBorder: focusedBorder,
          border: border,
        ),
      ),
    );

Widget defaultDropdown({
  required List<DropdownMenuItem<String>> items,
  FormFieldValidator<String>? validate,
  AutovalidateMode? autoValidateMode,
  onChange,
  Widget? hint,
  InputBorder? border,
  InputBorder? focusedBorder,
  InputBorder? enableBorder,
  Key? key,
  String? label,
  TextStyle? labelStyle,
  Icon? prefix,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 23.0, right: 23.0),
      child: DropdownButtonFormField(
        items: items,
        onChanged: onChange,
        validator: validate,
        autovalidateMode: autoValidateMode,
        hint: hint,
        isDense: true,
        key: key,
        menuMaxHeight: 120.0,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: labelStyle,
          prefixIcon: prefix,
          contentPadding: const EdgeInsets.only(left: 23.0, right: 23.0),
          border: border,
          enabledBorder: enableBorder,
          focusedBorder: focusedBorder,
        ),
      ),
    );

Widget defaultImagePicker({
  File? image,
  required function,
}) =>
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: 170,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(170.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: image != null
              ? Image.file(image)
              :
              // Image.file(File('https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png')),
              const Image(
                  image: NetworkImage(
                      'https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                ),
        ),
        CircleAvatar(
          radius: 18.0,
          backgroundColor: indigoAccent,
          child: IconButton(
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 20.0,
            ),
            onPressed: function,
          ),
        ),
      ],
    );

defaultAlert({
  required BuildContext context,
  required function,
}) =>
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Delete',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          content: const Text(
            'Do you want to delete ?',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {back(context);},
              child: const Text(
                'NO',
                style: TextStyle(
                  color: red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: function,
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );

Widget circle({
  required Color color,
}) =>
    Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );

Widget backCircle(context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 35.0,
        height: 35.0,
        decoration: const BoxDecoration(
          color: white,
          shape: BoxShape.circle,
        ),
//color: white,
        child: ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [defaultNavyBlue, defaultPurple],
          ).createShader(rect),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: grey,
            ),
            onPressed: () {
              back(context);
            },
          ),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

void back(context) => Navigator.pop(context);