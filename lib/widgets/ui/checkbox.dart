import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

final checkbox = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    RoundCheckBox(
      onTap: (selected) {},
      uncheckedWidget: const Icon(Icons.close),
      isChecked: true,
      size: 30,
      animationDuration: const Duration(
        milliseconds: 50,
      ),
    ),
  ],
);
