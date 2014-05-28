/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Paragraph extends Control{

  static const String CLASS = 'cnp-paragraph';
  
  final ParagraphElement _pEle = new ParagraphElement();
  String get text => _pEle.text;
  void set text (String text){_pEle.text = text;}

  Paragraph(String text){
    _paragraphStyle.insert();
    html.children.add(_pEle);
    addClass(CLASS);
    this.text = text;
  }

  static final Style _paragraphStyle = new Style('''

    .$CLASS
    {
    }

  ''');
}