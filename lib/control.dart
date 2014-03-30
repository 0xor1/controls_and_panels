/*
 * author: Daniel Robinson  http://github.com/0xor1
 */

part of controls_and_panels;

abstract class Control extends Base{
  static const String CLASS = 'cnp-control';
  static const String FOCUS = 'cnp-focus';
  static const String CONTROL_ID = 'cnp-control-id';
  static final Map<int, Control> _controls = new Map<int, Control>();
  static Control _currentFocus = null;
  static Control get currentFocus => _currentFocus;
  static Control getWithId(int id){ return _controls[id]; }
  static int _idSource = 0;
  final int _id;
  int get controlId => _id;
  String get id => html.id;
  void set id(String id){ html.id = id; }
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

  StreamController<Control> _blurController = new StreamController();
  Stream<Control> get onBlur => _blurController.stream.asBroadcastStream();

  void blur(){
    if(hasFocus){
      _currentFocus = null;
      html.classes.remove(FOCUS);
      _blurController.add(this);
    }
  }

  StreamController<Control> _focusController = new StreamController();
  Stream<Control> get onFocus => _focusController.stream.asBroadcastStream();
  bool get hasFocus => this == _currentFocus;

  void focus(){
    if(!hasFocus){
      if(_currentFocus != null){
        _currentFocus.blur();
      }
      _currentFocus = this;
      html.classes.add(FOCUS);
      _focusController.add(this);
    }
  }

  Control():
  _id = _idSource++{
    _controlStyle.insert();
    html
    ..classes.add(CLASS)
    ..dataset[CONTROL_ID] = _id.toString();

    _controls[_id] = this;

    if(_namespace != null){
      html.classes.add(_namespace);
    }

    html.onClick.listen((event) => focus());
    html.onClick.listen((event) => focus());
  }


  static final Style _controlStyle = new Style('''
  
    .$CLASS 
    {
    }
  
  ''');
}