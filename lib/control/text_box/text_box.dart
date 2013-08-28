/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String TEXT_BOX = 'text-box';
const String WATERMARK = 'watermark';


class TextBox extends Control{


  String get value => (html as InputElement).value;


  void set value (String str){

    (html as InputElement).value = str;

  }


  String _watermark = '';


  String get watermark => _watermark;


  void set watermark(String wm){

    var html = (_html as InputElement)
        ..blur();

    var oldWm = _watermark;
    _watermark = wm;

    if(html.value == '' || html.value == null || html.value == oldWm){
      html.value = _watermark;
      html.classes.add(WATERMARK);
    }

  }


  StreamSubscription<Event> removeWatermarkOnFocusSubscription;


  StreamSubscription<Event>  addWatermarkOnBlurSubscription;


  TextBox([String wm]){

    _insertTextBoxStyleElement();

    var classes = html.classes;

    var self = this;

    _html = new InputElement(type:'text')
      ..classes.addAll(classes)
      ..classes.add(TEXT_BOX)
      ..onBlur.listen(blur)
      ..onFocus.listen(focus);

    watermark = wm;

    addWatermarkOnBlurSubscription = html.onBlur.listen((Event event){
      self.watermark = self.watermark;
    });

    removeWatermarkOnFocusSubscription = html.onFocus.listen((Event event){
      value = value == watermark ? '' : value;
      html.classes.remove(WATERMARK);
    });

  }


}