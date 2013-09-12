/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String TEXT_BOX = 'text-box';


class TextBox extends Control{


  InputElement _inputElement = new InputElement(type:'text');


  String get value => _inputElement.value;


  void set value (String str){

    _inputElement.value = str == null? '': str;

  }


  String get placeholder => _inputElement.placeholder;


  void set placeholder (String str){

    _inputElement.placeholder = str == null? '': str;

  }


  TextBox({String value: null, String placeholder: null}){

    _insertStyle(_textBoxStyle);

    html.classes.add(TEXT_BOX);

    controlContentElement.children.add(_inputElement);

    _inputElement
      ..onBlur.listen(blur)
      ..onFocus.listen(focus);

    this.placeholder = placeholder;

    this.value = value;

  }


}



final Style _textBoxStyle = new Style('''

  .$TEXT_BOX
  {
    background: #fff;
    border: 1px solid #888;
  }

  .$TEXT_BOX.$FOCUS
  {
    outline: 1px solid #fa3;
  }

  .$TEXT_BOX > .$CONTROL_CONTENT_ELEMENT > input
  {
    width: calc(100% - 10px);
    padding: 5px;
    border: none;
  }

  .$TEXT_BOX > .$CONTROL_CONTENT_ELEMENT > input:focus
  {
    outline: none;
  }

''');