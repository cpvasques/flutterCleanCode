// Flutter Packages
import 'package:flutter/material.dart';

// Core
import 'package:flutter_clean_code/core/presentation/widgets/loader.dart';
import 'package:flutter_clean_code/core/presentation/widgets/messages.dart';

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
