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


  int get id => _id;


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

    html.attributes[CONTROL_ID] = _id.toString();

    _controls[_id] = this;

    onFocus.listen((Event event){

      if(currentFocus != null){

        currentFocus.blur(event);

      }

      currentFocus = this;

      html.classes.add(FOCUS);

    });

    onBlur.listen((Event event){

      currentFocus = null;

      html.classes.remove(FOCUS);

    });

  }


  void focus(Event event){

    _focusController.add(event);

  }


  void blur(Event event){

    _blurController.add(event);

  }


}