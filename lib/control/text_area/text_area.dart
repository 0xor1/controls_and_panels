/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String TEXT_AREA = 'text-area';


class TextArea extends Control{

  TextAreaElement _textAreaElement = new TextAreaElement();

  String get value => _textAreaElement.value;

  void set value (String str){

    _textAreaElement.value = str;

  }

  String get placeholder => _textAreaElement.placeholder;

  void set placeholder (String str){

    if(str == null){

      str = '';

    }

    _textAreaElement.placeholder = str;

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

    _insertTextAreaStyleElement();

    _html
      ..children.add(_textAreaElement)
      ..classes.add(TEXT_AREA);
    _textAreaElement
      ..onBlur.listen(blur)
      ..onFocus.listen(focus);

    this.placeholder = placeholder;
    this.rows = rows;
    this.cols = cols;

  }

}