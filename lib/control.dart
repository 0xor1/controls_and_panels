/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


//string constants used for html classes and attributes
const String CONTROL = 'control';
const String _POP_OVER_LAYOUT_ASSISTANT = 'pop-over-layout-assistant';

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

  final DivElement _popOverLayoutAssistant = new DivElement()
  ..classes.add(_POP_OVER_LAYOUT_ASSISTANT);


  Func_Control_PopOver createContextMenu;


  Func_Control_PopOver getTooltip;


  void set id(String id){

    _html.id = id;

  }


  StreamController _focusController = new StreamController();
  Stream _focusStream;
  Stream get onFocus => (_focusStream != null) ? _focusStream : _focusStream = _focusController.stream.asBroadcastStream();


  StreamController _blurController = new StreamController();
  Stream _blurStream;
  Stream get onBlur => (_blurStream != null) ? _blurStream : _blurStream = _blurController.stream.asBroadcastStream();


  StreamController _contextMenuController = new StreamController();
  Stream _contextMenuStream;
  Stream get onContextMenu => (_contextMenuStream != null) ? _contextMenuStream : _contextMenuStream = _contextMenuController.stream.asBroadcastStream();


  Control({Func_Control_PopOver createContextMenu: null})
    : _id = _idSource++{

    _insertStyle(_controlStyle);

    html
    ..classes.add(CONTROL)
    ..children.add(_popOverLayoutAssistant);

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

    if(createContextMenu != null){
      html.onContextMenu.listen((MouseEvent event){
        if(createContextMenu != null){
          event.preventDefault();
          event.stopPropagation();
          var contextMenu = createContextMenu(this); //todo get screen quadrant and display menu appropriately
          contextMenu.show(this, left: event.offsetX - 3 , top: event.offsetY - 3);
        }
      });
    }
  }


  bool get hasFocus => html.classes.contains(FOCUS);


  void focus(Event event){

    _focusController.add(event);

  }


  void blur(Event event){

    _blurController.add(event);

  }


}



final Style _controlStyle = new Style('''

  .$BASE.$CONTROL > .$_POP_OVER_LAYOUT_ASSISTANT
  {
    position: relative;
    width: 0;
    height: 0;
    margin: 0;
    border: 0;
    padding: 0;
    overflow: visible;
  }

''');