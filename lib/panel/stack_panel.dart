/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String STACK_PANEL = 'stack-panel';


const String HORIZONTAL = 'horizontal';


const String VERTICAL = 'vertical';


class StackPanel<TBase extends Base> extends Panel<TBase>{


  String _orientation;


  String get orientation => _orientation;


  StackPanel._internal(String orientation, List<TBase> bases){

    _insertStyle(_stackPanelStyle);

    if(bases != null){

      children.addAll(bases);

      html.children.addAll(bases.map((o) => o.html));

    }

    _orientation = orientation;
    
    html.classes.add(orientation);

    html.classes.add(STACK_PANEL);

  }


  factory StackPanel.vertical([List<TBase> bases]){

    return new StackPanel._internal(VERTICAL, bases);

  }


  factory StackPanel.horizontal([List<TBase> bases]){

    return new StackPanel._internal(HORIZONTAL, bases);

  }

  
  Splitter addSplitter({String lineColor: '#000', String lineStyle: 'solid', int lineThickness: 1, int beforeMargin: 0, int afterMargin: 0}){
    
    Splitter splitter;
    
    if(_orientation == HORIZONTAL){
      
      splitter = new Splitter.vertical(lineColor: lineColor, lineStyle: lineStyle, lineThickness: lineThickness, beforeMargin: beforeMargin, afterMargin: afterMargin);
      
    }else{
      
      splitter = new Splitter.horizontal(lineColor: lineColor, lineStyle: lineStyle, lineThickness: lineThickness, beforeMargin: beforeMargin, afterMargin: afterMargin);
            
    }
    
    add(splitter);
    
    return splitter;
    
  }

  void add(TBase base){

    children.add(base);

    html.children.add(base.html);

  }


  void insert(int index, TBase base){

    children.insert(index, base);

    html.children.insert(index, base.html);

  }


  bool remove(TBase base){

    bool removed = children.remove(base);

    if(removed){

      html.children.remove(base.html);

    }

    return removed;

  }


  TBase removeAt(int index){

    TBase base = children.removeAt(index);

    if(base != null){

      html.children.remove(base.html);

    }

    return base;

  }


}



final Style _stackPanelStyle = new Style('''

  .$STACK_PANEL.$VERTICAL > .$BASE
  {
    clear: left;
    float: left;
  }

  
  .$STACK_PANEL.$HORIZONTAL
  {
    white-space: nowrap;
    font-size: 0;
  }

  .$STACK_PANEL.$HORIZONTAL > .$BASE
  {
    word-spacing: normal;
    vertical-align: middle;
    font-size: 16px;
  }

''');