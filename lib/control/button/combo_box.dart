/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String COMBO_BOX = 'combo-box';


class ComboBox extends Button{


  Func_String_Future$List$Control$$ controlListGetter;


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

  
  bool isOpen = false;
  
  
  String currentSearch;

  
  ComboBox(Func_String_Future$List$Control$$ listGetter, Control initialSelection, Image arrowIcon, {Control noSelection: null}):
  super(){

    _insertStyle(_comboBoxStyle);

    controlListGetter = listGetter;

    content = new StackPanel.horizontal()
    ..add(initialSelection)
    ..add(arrowIcon);

    html.classes.add(COMBO_BOX);
    
    html.onClick.listen((MouseEvent event){
      
      toggleOpenClose();
      
    });

  }
  
  
  void toggleOpenClose(){
    
    if(isOpen){
      
      close();
      
    }else{
      
      open();
      
    }
    
  }
  
  
  void open(){
  
    controlListGetter('').then((List<Control> controlList){
      //create new popover dropdown
      SimpleDropDown dropDown = new SimpleDropDown(new StackPanel<Control>.horizontal(controlList));
      PopOver popOver = new PopOver(content: dropDown);
      //stage
      stageBase(popOver);
      //workout if up or down is optimal space - only show UP if down would require overflow-y: auto;
      //if(html.client.bottom > html.clientTop || html.client.bottom > popOver.html.clientHeight){
        _bottomLeftPopOverLayoutAssistant.children.add(popOver.html);
      //}else{
      //  _topLeftPopOverLayoutAssistant.children.add(
      //      popOver.html
      //      ..style.bottom = '0');
      //}
      //workout available size
      //size appropriately
      //set keyboard event and mouse click/context events on window to pass in string or close popover
    });
    
  }


  void close(){
    
    
    
  }
  
  
}



final Style _comboBoxStyle = new Style('''

  .$COMBO_BOX
  {
    background: #fff;
  }

''');