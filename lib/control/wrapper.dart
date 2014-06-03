/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Wrapper extends Control{
  static const String CLASS = 'cnp-wrapper';
  Wrapper(Element el){
    addClass(CLASS);
    html.children.add(el);
  }
}