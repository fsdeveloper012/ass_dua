import 'package:flutter/material.dart';

import 'colors.dart';

class CustomButton extends StatelessWidget {
  final String text;

  // final onPressed;

  CustomButton({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0), color: primaryColor),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: white)),
        ));
  }
}

class CustomTextField extends StatefulWidget {
  String hint;
  TextEditingController textEditingController;
  TextInputType textInputType;
  bool? obscureText;
  Function(String)? onChanged;
  String validatorMessage;
  Widget? prefixIcon;

  CustomTextField(
      {super.key,
      required this.hint,
      required this.textEditingController,
      required this.textInputType,
      this.obscureText = false,
      this.onChanged,
      required this.validatorMessage,
      required this.prefixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              obscureText: widget.obscureText ?? false,
              controller: widget.textEditingController,
              decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.all(0.13),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 1.0,
                  ),
                ),
                prefixIcon: widget.prefixIcon,
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: showError ? Colors.red : Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return widget.validatorMessage ??
                      'Please Fill Field.'; // Use the provided message or a default one
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
