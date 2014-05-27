/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Alignment{
  final String _ali;
  static const Alignment TOP = const Alignment._internal('top');
  static const Alignment BOTTOM = const Alignment._internal('bottom');
  static const Alignment LEFT = const Alignment._internal('left');
  static const Alignment RIGHT = const Alignment._internal('right');
  const Alignment._internal(this._ali);
  operator ==(other) => other is Alignment && _ali == other._ali;
  int get hashCode => _ali.hashCode;
  String toString() => _ali;
}