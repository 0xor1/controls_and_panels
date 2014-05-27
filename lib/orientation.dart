/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Orientation{
  final String _ori;
  static const Orientation HORIZONTAL = const Orientation._internal('horizontal');
  static const Orientation VERTICAL = const Orientation._internal('vertical');
  const Orientation._internal(this._ori);
  operator ==(other) => other is Orientation && _ori == other._ori;
  int get hashCode => _ori.hashCode;
  String toString() => _ori;
}