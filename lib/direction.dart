/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Direction extends EnumValue{
  static const Direction UP = const Direction._internal('up');
  static const Direction DOWN = const Direction._internal('down');
  static const Direction LEFT = const Direction._internal('left');
  static const Direction RIGHT = const Direction._internal('right');
  const Direction._internal(String dir):super(dir);
  operator ==(other) => other is Direction && value == other.value;
}