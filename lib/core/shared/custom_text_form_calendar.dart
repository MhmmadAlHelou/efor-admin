import 'package:flutter/material.dart';

class CustomTextFormCalendar extends StatelessWidget {
  const CustomTextFormCalendar({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.myController,
    required this.valid,
    // required this.isNumber,
    // this.obscureText,
    // this.onTapIcon,
  });

  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?) valid;
  // final bool isNumber;
  // final bool? obscureText;
  // final void Function()? onTapIcon;

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2200),
    );

    if (picked != null) {
      myController.text = picked.toString().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        // obscureText: obscureText == null || obscureText == false ? false : true,
        // keyboardType: isNumber
        //     ? const TextInputType.numberWithOptions(decimal: true)
        //     : TextInputType.text,
        readOnly: true, //
        onTap: () {
          selectDate(context);
        },
        validator: valid,
        controller: myController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(labelText),
          ),
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
