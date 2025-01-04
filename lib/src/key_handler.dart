import 'package:flutter/material.dart';

enum KeyPressed { up, down, left, right, enter, none }

class KeyHandler extends ChangeNotifier {
  bool _up = false;
  bool _down = false;
  bool _left = false;
  bool _right = false;
  bool _enter = false;

  bool get arrows => _up || _left || _down || _right;
  bool get any => arrows || _enter;
  bool get up => _up;
  bool get down => _down;
  bool get left => _left;
  bool get right => _right;
  bool get enter => _enter;

  KeyPressed get keyPressed {
    if (_up) return KeyPressed.up;
    if (_down) return KeyPressed.down;
    if (_left) return KeyPressed.left;
    if (_right) return KeyPressed.right;
    if (_enter) return KeyPressed.enter;
    return KeyPressed.none;
  }

  void keyUp(bool pressed) {
    _up = pressed;
    notifyListeners();
  }

  void keyDown(bool pressed) {
    _down = pressed;
    notifyListeners();
  }

  void keyLeft(bool pressed) {
    _left = pressed;
    notifyListeners();
  }

  void keyRight(bool pressed) {
    _right = pressed;
    notifyListeners();
  }

  void keyEnter(bool pressed) {
    _enter = pressed;
    notifyListeners();
  }

  void reset() {
    _up = false;
    _down = false;
    _right = false;
    _left = false;
    _enter = false;
    notifyListeners();
  }
}
