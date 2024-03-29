import 'package:flutter/material.dart';
import 'package:flutter_clean_code/core/utils/loader.dart';
import 'package:flutter_clean_code/core/utils/messages.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with Loader, Messages {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
