/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */


part of controls_and_panels;

class TextArea extends Control{

  static const String CLASS = 'cnp-text-area';
  TextAreaElement _textAreaElement = new TextAreaElement();
  String get value => _textAreaElement.value;
  void set value (String str){
    _textAreaElement.value = str == null? '': str;
  }

  String get placeholder => _textAreaElement.placeholder;
  void set placeholder (String str){
    _textAreaElement.placeholder = str == null? '': str;
  }

  int get rows => _textAreaElement.rows;
  void set rows(int num){
    _textAreaElement.rows = num;
  }

  int get cols => _textAreaElement.cols;
  void set cols(int num){
    _textAreaElement.cols = num;
  }

  TextArea({ int rows: 4, int cols: 50, String placeholder: ''}){
    _textAreaStyle.insert();
    addClass(CLASS);
    html.children.add(_textAreaElement);
    _textAreaElement
      ..onBlur.listen((_) => blur())
      ..onFocus.listen((_) => focus());
    this.placeholder = placeholder;
    this.rows = rows;
    this.cols = cols;
  }

  static final Style _textAreaStyle = new Style('''

    $CLASS > textarea
    {
      margin: 0;
      border: 1px solid #888;
      padding: 5px;
    }

  ''');
}