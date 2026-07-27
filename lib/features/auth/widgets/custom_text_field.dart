import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: Color(0xffC89A55),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            obscureText: widget.isPassword ? _obscureText : false,

            style: const TextStyle(color: Colors.white, fontSize: 16),

            cursorColor: const Color(0xffC89A55),

            decoration: InputDecoration(
              filled: true,

              fillColor: const Color(0xff151515),

              hintText: widget.label,

              hintStyle: const TextStyle(color: Colors.white38),

              prefixIcon: Icon(widget.icon, color: const Color(0xffC89A55)),

              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xffC89A55),
                      ),
                    )
                  : null,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Colors.grey.shade800),
              ),

              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                borderSide: BorderSide(color: Color(0xffC89A55), width: 2),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.red),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.red),
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
