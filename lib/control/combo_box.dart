/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String COMBO_BOX = 'combo-box';


class ComboBox extends Button{


  Func_String_Future$List$Control$$ ControlListGetter;


  List<Control> _controlList;
  
  
  int selectedIndex;
  
  
  Control selectedControl;
  
  
  Control noSelection;
  
  
  StreamController _dropDownOpenController = new StreamController();


  Stream _dropDownOpenStream;


  Stream get onDropDownOpen => (_dropDownOpenStream != null) ? _dropDownOpenStream : _dropDownOpenStream = _dropDownOpenController.stream.asBroadcastStream();

  
  StreamController _dropDownCloseController = new StreamController();


  Stream _dropDownCloseStream;


  Stream get onDropDownClose => (_dropDownCloseStream != null) ? _dropDownCloseStream : _dropDownCloseStream = _dropDownCloseController.stream.asBroadcastStream();

  
  StreamController _selectionChangeController = new StreamController();


  Stream _selectionChangeStream;


  Stream get onSelectionChange => (_selectionChangeStream != null) ? _selectionChangeStream : _selectionChangeStream = _selectionChangeController.stream.asBroadcastStream();


  ComboBox(Func_String_Future$List$Control$$ listGetter, Control initialSelection, Image arrowIcon, {Control noSelection: null}):
  super(){

    _insertStyle(_comboBoxStyle);

    ControlListGetter = listGetter;

    content = new StackPanel.horizontal()
    ..add(initialSelection)
    ..add(arrowIcon);
    
    html.classes.add(COMBO_BOX);
    
  }


}



final Style _comboBoxStyle = new Style('''

  .$COMBO_BOX
  {
    
  }

''');