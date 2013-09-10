/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


const String CONTROL = 'control';


const String _POP_OVER_LAYOUT_ASSISTANT = 'pop-over-layout-assistant';


const String _RIGHT = 'right';


const String CONTROL_CONTENT_ELEMENT = 'control-content-element';


const String FOCUS = 'focus';


const String CONTROL_ID = 'control-id';


final Map<int, Control> _controls = new Map<int, Control>();


Control currentFocus = null;


Control getControlWithId(int id){

  return _controls[id];

}


abstract class Control extends Base{


  static int _idSource = 0;


  final int _id;


  int get controlId => _id;


  String get id => html.id;


  void set id(String id){

    html.id = id;

  }


  static String _namespace;


  static String get namespace => _namespace;


  static void set namespace (String ns){

    String oldNamespace = _namespace;

    _namespace = ns;

    _controls.forEach((int id, Control control){

      if(oldNamespace != null){

        control.html.classes.remove(oldNamespace);

      }

      if(_namespace != null && _namespace != ''){

        control.html.classes.add(_namespace);

      }

    });
  }


  final DivElement _topLeftPopOverLayoutAssistant = new DivElement()
  ..classes.add(_POP_OVER_LAYOUT_ASSISTANT);


  final DivElement _topRightPopOverLayoutAssistant = new DivElement()
  ..classes.addAll([_RIGHT, _POP_OVER_LAYOUT_ASSISTANT]);


  final DivElement _bottomLeftPopOverLayoutAssistant = new DivElement()
  ..classes.add(_POP_OVER_LAYOUT_ASSISTANT);


  final DivElement _bottomRightPopOverLayoutAssistant = new DivElement()
  ..classes.addAll([_RIGHT, _POP_OVER_LAYOUT_ASSISTANT]);


  final DivElement controlContentElement = new DivElement()
  ..classes.add(CONTROL_CONTENT_ELEMENT);


  StreamController _focusController = new StreamController();


  Stream _focusStream;


  Stream get onFocus => (_focusStream != null) ? _focusStream : _focusStream = _focusController.stream.asBroadcastStream();


  bool get hasFocus => html.classes.contains(FOCUS);


  void focus(Event event){

    _focusController.add(event);

  }


  StreamController _blurController = new StreamController();


  Stream _blurStream;


  Stream get onBlur => (_blurStream != null) ? _blurStream : _blurStream = _blurController.stream.asBroadcastStream();


  void blur(Event event){

    _blurController.add(event);

  }


  Control():
  _id = _idSource++{

    _insertStyle(_controlStyle);

    html
    ..classes.add(CONTROL)
    ..children.add(_topLeftPopOverLayoutAssistant)
    ..children.add(_topRightPopOverLayoutAssistant)
    ..children.add(controlContentElement)
    ..children.add(_bottomLeftPopOverLayoutAssistant)
    ..children.add(_bottomRightPopOverLayoutAssistant);

    if(_namespace != null){

      html.classes.add(_namespace);

    }

    html.dataset[CONTROL_ID] = _id.toString();

    _controls[_id] = this;

    onFocus.listen((Event event){

      if(currentFocus != this){

        if(currentFocus != null){

          currentFocus.html.classes.remove(FOCUS);

          currentFocus.blur(event);

        }

        currentFocus = this;

        html.classes.add(FOCUS);

      }

    });

    html.onClick.listen((MouseEvent event){

      focus(event);

    });

  }


}



final Style _controlStyle = new Style('''

  .$CONTROL > *
  {
    display: block;
    margin: 0;
    border: 0;
    padding: 0;
    overflow: visible;
  }

  .$CONTROL > .$_POP_OVER_LAYOUT_ASSISTANT
  {
    position: relative;
    width: 0;
    height: 0;
  }

  $CONTROL > .$_POP_OVER_LAYOUT_ASSISTANT.$_RIGHT
  {
    left: 100%;
  }


''');