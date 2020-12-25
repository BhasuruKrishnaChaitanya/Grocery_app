import 'package:flutter/material.dart';
class WeightDropDown extends StatelessWidget {
  final List<String> weight;
  final String selected;
  final Function changeSel;
  WeightDropDown(this.weight, this.selected, this.changeSel);
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      iconSize: 0,
      selectedItemBuilder: (BuildContext context) {
        return weight.map<Widget>((String item) {
          return Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: SizedBox(
                  width: 35,
                  height: 17,
                  child: FittedBox(
                                    child: Text(
                      item,overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          );
        }).toList();
      },
      value: selected,
      onChanged: (value) {
        changeSel(value);
      },
      items: weight
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
    );
  }
}