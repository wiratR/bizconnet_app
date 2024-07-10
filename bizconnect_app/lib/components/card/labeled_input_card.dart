import 'package:flutter/material.dart';

class LabeledInputCard extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isRequired;
  final bool isPassword;

  const LabeledInputCard({
    Key? key,
    required this.labelText,
    required this.controller,
    this.isRequired = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _LabeledInputCardState createState() => _LabeledInputCardState();
}

class _LabeledInputCardState extends State<LabeledInputCard> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      padding: const EdgeInsets.symmetric(vertical: 4.0), // Adjust padding to fit within height
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.labelText,
                style: TextStyle(
                  color: Color(0xFF122D58),
                  fontSize: 14,
                  fontFamily: 'FC Iconic',
                  fontWeight: FontWeight.w400,
                  height: 1.2, // Adjusted for proper text height
                ),
              ),
              if (widget.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: Color(0xFFFF3A44),
                    fontSize: 14,
                    fontFamily: 'FC Iconic',
                    fontWeight: FontWeight.w400,
                    height: 1.2, // Adjusted for proper text height
                  ),
                ),
            ],
          ),
          SizedBox(height: 4.0), // Adjusted space between label and input
          Container(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFEAF4FF)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    obscureText: widget.isPassword ? _obscureText : false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (widget.isPassword)
                  IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
