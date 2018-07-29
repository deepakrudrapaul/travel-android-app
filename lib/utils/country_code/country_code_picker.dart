library country_code_picker;

import 'package:flutter/material.dart';
import 'package:wanderwagon/utils/country_code/celement.dart';
import 'package:wanderwagon/utils/country_code/country_codes.dart';
import 'package:wanderwagon/utils/country_code/selection_dialog.dart';

export 'celement.dart';

class CountryCodePicker extends StatefulWidget {
  final Function(CElement) onChanged;
  final String initialSelection;
  final List<String> favorite;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;

  CountryCodePicker(
      {this.onChanged,
        this.initialSelection,
        this.favorite,
        this.textStyle,
        this.padding});

  @override
  State<StatefulWidget> createState() {
    List<Map> jsonList = codes;

    List<CElement> elements = jsonList
        .map((s) => new CElement(
      name: s['name'],
      code: s['code'],
      dialCode: s['dial_code'],
      flagUri: 'flags/${s['code'].toLowerCase()}.png',
    ))
        .toList();

    return new _CountryCodePickerState(elements);
  }
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  CElement selectedItem;
  List<CElement> elements = [];
  List<CElement> favoriteElements = [];

  _CountryCodePickerState(this.elements);

  @override
  Widget build(BuildContext context) => InkWell(
          child:Text(
            selectedItem.toString(),
            style: widget.textStyle ?? Theme.of(context).textTheme.subhead,
          ),
    onTap: _showSelectionDialog,
  );

  @override
  initState() {
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
              (e) =>
          (e.code.toUpperCase() == widget.initialSelection.toUpperCase()) ||
              (e.dialCode == widget.initialSelection.toString()),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    favoriteElements = elements
        .where((e) =>
    widget.favorite.firstWhere(
            (f) => e.code == f.toUpperCase() || e.dialCode == f.toString(),
        orElse: () => null) !=
        null)
        .toList();
    super.initState();
  }

  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (_) => new SelectionDialog(elements, favoriteElements),
    ).then((e) {
      if (e != null) {
        setState(() {
          selectedItem = e;
        });

        if (widget.onChanged != null) {
          widget.onChanged(e);
        }
      }
    });
  }
}
