import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  const CustomDropDownList({
    super.key,
    required this.title,
    required this.listData,
    required this.dropDownSelectedName,
    required this.dropDownSelectedId,
  });

  final String title;
  final List<SelectedListItem> listData;
  final TextEditingController dropDownSelectedName;
  final TextEditingController dropDownSelectedId;

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  void showDropDownSearch() {
    DropDownState(
      DropDown(
        // dropDownBackgroundColor: Colors.white,
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            // color: AppColor.white,
          ),
        ),
        data: widget.listData,
        onSelected: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropDownSelectedName.text = selectedListItem.name;
          widget.dropDownSelectedId.text = selectedListItem.value!;
          print('===========');
          print(widget.dropDownSelectedId.text);
          print(widget.dropDownSelectedName.text);
          print('===========');
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropDownSelectedName,
      cursorColor: Colors.white,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownSearch();
      },
      decoration: InputDecoration(
        hintText: widget.dropDownSelectedName.text == ""
            ? widget.title
            : widget.dropDownSelectedName.text,
        hintStyle: const TextStyle(fontSize: 14),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        label: Container(
          margin: const EdgeInsets.symmetric(horizontal: 9),
          child: Text(widget.dropDownSelectedName.text == ""
              ? widget.title
              : widget.dropDownSelectedName.text),
        ),
        suffixIcon: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            showDropDownSearch();
          },
          child: const Icon(Icons.arrow_drop_down),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        filled: true,
        fillColor: Colors.black12,
      ),
    );
  }
}
