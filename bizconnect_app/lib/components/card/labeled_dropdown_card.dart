import 'package:flutter/material.dart';

class LabeledDropdownCard extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final String? selectedItem;
  final bool isRequired;
  final ValueChanged<String?> onChanged;

  const LabeledDropdownCard({
    Key? key,
    required this.labelText,
    required this.items,
    this.selectedItem,
    this.isRequired = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _LabeledDropdownCardState createState() => _LabeledDropdownCardState();
}

class _LabeledDropdownCardState extends State<LabeledDropdownCard> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                  height: 1.2,
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
                    height: 1.2,
                  ),
                ),
            ],
          ),
          SizedBox(height: 4.0),
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
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                  widget.onChanged(newValue);
                },
                items: widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}