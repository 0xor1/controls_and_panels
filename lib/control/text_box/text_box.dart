/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String TEXT_BOX = 'text-box';
const String WATERMARK = 'watermark';


class TextBox extends Control{


  InputElement _inputElement = new InputElement(type:'text');


  String get value => _inputElement.value == _watermark ? '' : _inputElement.value;


  void set value (String str){

    _inputElement.value = str;

  }


  String _watermark = '';


  String get watermark => _watermark;


  void set watermark(String wm){

    var oldWm = _watermark;
    _watermark = wm;

    if(value == '' || value == null || value == oldWm){
      value = _watermark;
      html.classes.add(WATERMARK);
    }

  }


  TextBox([String wm]){

    _insertTextBoxStyleElement();

    _html
      ..children.add(_inputElement)
      ..classes.add(TEXT_BOX);
    _inputElement
      ..onBlur.listen(blur)
      ..onFocus.listen(focus);

    watermark = wm;

    onBlur.listen((Event event){
      watermark = watermark;
    });

    onFocus.listen((Event event){
      value = value == '' ? '' : value;
      html.classes.remove(WATERMARK);
    });

  }


}