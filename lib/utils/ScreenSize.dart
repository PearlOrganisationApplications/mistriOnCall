import 'package:flutter/material.dart';

class ScreenSize {
  static ScreenSize? _instance;

  late Size _size;
  bool _initialized = false;

  factory ScreenSize() {
    _instance ??= ScreenSize._(); // Create a new instance if it doesn't exist
    return _instance!;
  }

  ScreenSize._(); // Private constructor

  void initialize(BuildContext context) {
    // Ensure initialization only once
    if (!_initialized) {
      // Obtain the screen size using MediaQuery
      _size = MediaQuery.of(context).size;
      _initialized = true;
    }
  }

  Size get size {
    // Ensure that initialize() has been called before accessing size
    assert(_initialized, 'ScreenSize must be initialized before accessing size.');
    return _size;
  }
}
