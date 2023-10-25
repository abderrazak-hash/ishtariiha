import 'package:flutter/material.dart';
import 'package:ishtariha/constants.dart';

class CheckSquare extends Checkbox {
  const CheckSquare({
    Key? key,
    required super.value,
    super.tristate = false,
    required super.onChanged,
    super.mouseCursor,
    super.activeColor = mainClr,
    super.fillColor,
    super.checkColor,
    super.focusColor,
    super.hoverColor,
    super.overlayColor,
    super.splashRadius,
    super.materialTapTargetSize,
    super.visualDensity,
    super.focusNode,
    super.autofocus = false,
    super.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(6.0),
      ),
      // side: BorderSide(color: mainClr, width: 1.0),
    ),
    super.side,
  }) : super(key: key);
}
