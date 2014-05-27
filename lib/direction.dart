/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Direction{
  final String _dir;
  static const Direction UP = const Direction._internal('up');
  static const Direction DOWN = const Direction._internal('down');
  static const Direction LEFT = const Direction._internal('left');
  static const Direction RIGHT = const Direction._internal('right');
  const Direction._internal(this._dir);
  operator ==(other) => other is Direction && _dir == other._dir;
  int get hashCode => _dir.hashCode;
  String toString() => _dir;
}