import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ishtariha/constants.dart';

// ignore: must_be_immutable
class IshSelector extends StatefulWidget {
  String title;
  final List<String> items;
  Function onSelect;
  IshSelector(
      {Key? key,
      required this.title,
      required this.items,
      required this.onSelect})
      : super(key: key);

  @override
  State<IshSelector> createState() => _IshSelectorState();
}

class _IshSelectorState extends State<IshSelector> {
  Random rnd = Random();
  double border = 0.0;
  Color color = Colors.transparent;
  bool expanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant IshSelector oldWidget) {
    if (oldWidget.title != widget.title) {
      setState(() {
        oldWidget.title = widget.title;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Container(
        height: expanded
            ? widget.items.length > 2
                ? 205.0
                : widget.items.length * 50 + 55
            : 60.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: whitish,
        ),
        child: ExpansionTile(
          key: Key(rnd.nextDouble().toString()),
          initiallyExpanded: expanded,
          maintainState: false,
          iconColor: mainClr,
          collapsedIconColor: grey,
          leading: Icon(
            expanded
                ? Icons.keyboard_arrow_down_rounded
                : Icons.keyboard_arrow_left_rounded,
            size: 33.0,
          ),
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.items.contains(widget.title) ? mainClr : grey,
                fontFamily: 'ElMessiri',
                fontSize: 15.0,
              ),
            ),
          ),
          trailing: const SizedBox(),
          onExpansionChanged: (value) {
            setState(() {
              expanded = value;
            });
          },
          children: [
            Container(
              height:
                  widget.items.length > 2 ? 150.0 : widget.items.length * 50,
              color: whitish,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Drawer(
                  backgroundColor: whitish,
                  elevation: 0.0,
                  child: ListView(
                    key: const PageStorageKey<String>('lisences'),
                    children: List.generate(widget.items.length, (index) {
                      String item = widget.items[index];
                      return ListTile(
                        selected: widget.title == item,
                        selectedColor: mainClr,
                        hoverColor: greyish.withOpacity(1),
                        selectedTileColor: greyish,
                        onTap: () {
                          setState(() {
                            expanded = false;
                          });
                          widget.onSelect(item);
                        },
                        title: Center(
                          child: Text(
                            item,
                            style: TextStyle(
                              color: widget.title == item ? mainClr : grey,
                              fontFamily: 'ElMessiri',
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
