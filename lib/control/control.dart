/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


//string constants used for html classes and attributes
const String CONTROL = 'control';


const String CONTROL_ID = 'control-id';


const String FOCUS = 'focus';


final Map<int, Control> _controls = new Map<int, Control>();


Control currentFocus = null;


int _idSource = 0;


String _namespace;


String get namespace => _namespace;


void set namespace (String ns){

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


Control getControlWithId(int id){

  return _controls[id];

}


abstract class Control extends Base{


  final int _id;


  int get controlId => _id;


  String get id => _html.id;


  PopOver tooltip;


  PopOver contextMenu;


  void set id(String id){

    _html.id = id;

  }


  StreamController _focusController = new StreamController();
  Stream _focusStream;
  Stream get onFocus => (_focusStream != null) ? _focusStream : _focusStream = _focusController.stream.asBroadcastStream();


  StreamController _blurController = new StreamController();
  Stream _blurStream;
  Stream get onBlur => (_blurStream != null) ? _blurStream : _blurStream = _blurController.stream.asBroadcastStream();


  Control()
    : _id = _idSource++{

    html.classes.add(CONTROL);

    if(_namespace != null){

      html.classes.add(_namespace);

    }

    html.dataset[CONTROL_ID] = _id.toString();

    _controls[_id] = this;

    onFocus.listen((Event event){

      //print('focus'); TODO work out why this fires 3 times when a textbox gets focus????

      if(currentFocus != this){

        if(currentFocus != null){

          currentFocus.blur(event);

          currentFocus.html.classes.remove(FOCUS);

          currentFocus = null;

        }

        currentFocus = this;

        html.classes.add(FOCUS);

      }

    });


    html.onClick.listen((MouseEvent event){
      focus(event);
    });
  }


  bool get hasFocus => html.classes.contains(FOCUS);


  void focus(Event event){

    _focusController.add(event);

  }


  void blur(Event event){

    _blurController.add(event);

  }


}