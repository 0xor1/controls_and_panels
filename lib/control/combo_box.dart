/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String COMBO_BOX = 'combo-box';


const String CLOSED = 'closed';


const String OPEN = 'open';


typedef Future<List<Base>> GetBaseList(String filter);


typedef void ProcessSelectedBase(Base base);


class ComboBox extends Control{


  GetBaseList getBaseList;


  ProcessSelectedBase processSelection;


  List<Base> _baseList;


  ComboBox(GetBaseList getList, ProcessSelectedBase selectionProcessor){

    _insertStyle(_comboBoxStyle);

    getBaseList = getList;

    processSelection = selectionProcessor;

    html.classes.addAll([COMBO_BOX, CLOSED]);

    _attachEventListeners();

  }


  _selectItem(Base base){


  }


  bool get isOpen => html.classes.contains(OPEN);


  void toggleOpenClose(){

    if(isOpen){

      close();

    }else{

      open();

    }

  }


  void open(){

    html.classes.remove(CLOSED);

    html.classes.add(OPEN);

  }


  void close(){

    html.classes.remove(OPEN);

    html.classes.add(CLOSED);

  }


  void _attachEventListeners(){



  }


}



final Style _comboBoxStyle = new Style('''

  .$COMBO_BOX
  {
    
  }

''');