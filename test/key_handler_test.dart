import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_mouse/src/key_handler.dart';

void main() {
  group('KeyHandler', () {
    late KeyHandler keyHandler;

    setUp(() {
      keyHandler = KeyHandler();
    });

    test('initial state is correct', () {
      expect(keyHandler.up, false);
      expect(keyHandler.down, false);
      expect(keyHandler.left, false);
      expect(keyHandler.right, false);
      expect(keyHandler.enter, false);
      expect(keyHandler.any, false);
      expect(keyHandler.arrows, false);
      expect(keyHandler.keyPressed, KeyPressed.none);
    });

    test('keyUp sets _up to true', () {
      keyHandler.keyUp(true);
      expect(keyHandler.up, true);
      expect(keyHandler.keyPressed, KeyPressed.up);
    });

    test('keyDown sets _down to true', () {
      keyHandler.keyDown(true);
      expect(keyHandler.down, true);
      expect(keyHandler.keyPressed, KeyPressed.down);
    });

    test('keyLeft sets _left to true', () {
      keyHandler.keyLeft(true);
      expect(keyHandler.left, true);
      expect(keyHandler.keyPressed, KeyPressed.left);
    });

    test('keyRight sets _right to true', () {
      keyHandler.keyRight(true);
      expect(keyHandler.right, true);
      expect(keyHandler.keyPressed, KeyPressed.right);
    });

    test('keyEnter sets _enter to true', () {
      keyHandler.keyEnter(true);
      expect(keyHandler.enter, true);
      expect(keyHandler.keyPressed, KeyPressed.enter);
    });

    test('reset sets all keys to false', () {
      keyHandler.keyUp(true);
      keyHandler.keyDown(true);
      keyHandler.keyLeft(true);
      keyHandler.keyRight(true);
      keyHandler.keyEnter(true);
      keyHandler.reset();
      expect(keyHandler.up, false);
      expect(keyHandler.down, false);
      expect(keyHandler.left, false);
      expect(keyHandler.right, false);
      expect(keyHandler.enter, false);
      expect(keyHandler.keyPressed, KeyPressed.none);
    });
  });
}
