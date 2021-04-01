import 'package:conversor_moedas/app/models/currency.model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final CurrencyModel selectedItem;
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final void Function(CurrencyModel) onChanged;

  const CurrencyBox(
      {Key key, this.items, this.controller, this.onChanged, this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              value: selectedItem,
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber))),
          ),
        )
      ],
    );
  }
}
