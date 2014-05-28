/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Alignment extends EnumValue{
  static const Alignment TOP = const Alignment._internal('top');
  static const Alignment BOTTOM = const Alignment._internal('bottom');
  static const Alignment LEFT = const Alignment._internal('left');
  static const Alignment RIGHT = const Alignment._internal('right');
  static const Alignment CENTER = const Alignment._internal('center');
  static const Alignment _H_CENTER = const Alignment._internal('h-center');
  static const Alignment _V_CENTER = const Alignment._internal('v-center');
  const Alignment._internal(String ali):super(ali);
  operator ==(other) => other is Alignment && value == other.value;
}