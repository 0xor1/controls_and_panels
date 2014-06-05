/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Paragraph extends Control{

  static const String CLASS = 'cnp-paragraph';

  final ParagraphElement _paraEle = new ParagraphElement();
  String get text => _paraEle.text;
  void set text (String text){ _paraEle.text = text; }

  Paragraph(String text){
    _paragraphStyle.insert();
    addClass(CLASS);
    html.append(_paraEle);
    this.text = text;
  }

  static final Style _paragraphStyle = new Style('''

    .$CLASS
    {
    }

  ''');
}