import 'package:flutter/material.dart';

class CustompasswordField extends StatelessWidget {
  const CustompasswordField({
    Key? key,
    required this.passwordController,
    required this.obscureText,
    required this.validator,
    required this.obsOnTap,
    required this.label,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController passwordController;
  final Function(String)? onChanged;
  final bool obscureText;
  final String? Function(String?) validator;
  final Function()? obsOnTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onEditingComplete: () => FocusScope.of(context).unfocus(),
        onChanged: onChanged,
        style: const TextStyle(color: Colors.grey),
        cursorColor: Colors.grey,
        keyboardType: TextInputType.visiblePassword,
        controller: passwordController,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: obsOnTap,
              child: Icon(
                obscureText == false
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                color: Colors.grey,
                size: 24,
              ),
            ),
          ),
          labelText: label,
        ));
  }
}
