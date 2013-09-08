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

    _insertStyle(_textAreaStyle);

    html.classes.add(TEXT_AREA);

    controlContentElement.children.add(_textAreaElement);

    _textAreaElement
      ..onBlur.listen(blur)
      ..onFocus.listen(focus);

    this.placeholder = placeholder;
    this.rows = rows;
    this.cols = cols;

  }

}



final Style _textAreaStyle = new Style('''

  .$BASE.$CONTROL.$TEXT_AREA > .$CONTROL_CONTENT_ELEMENT > textarea
  {
    margin: 0;
    border: 1px solid #888;
    padding: 5px;
  }

''');