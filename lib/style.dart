/*
 * author: Daniel Robinson  http://github.com/0xor1
 */

part of controls_and_panels;

class Style{
  static final StyleElement _controlsAndPanelsStyleElement = new StyleElement()
  ..id = 'controls-and-panels-style-element-id';
  bool _hasBeenInserted = false;
  final String text;

  Style(String this.text);

  void insert(){
    if(_controlsAndPanelsStyleElement.parent != document.head){
      document.head.children.add(_controlsAndPanelsStyleElement);
    }
    if(!_hasBeenInserted){
      _controlsAndPanelsStyleElement.text += text;
      _hasBeenInserted = true;
    }
  }
}