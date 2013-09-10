/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String STACK_PANEL = 'stack-panel';


const String STACK_SLOT = 'stack-slot';


const String HORIZONTAL = 'horizontal';


const String VERTICAL = 'vertical';


class StackPanel<TBase extends Base> extends Panel<TBase>{


  String _orientation;


  String get orientation => _orientation;


  void set orientation (String ori){

    if(ori != orientation){

      html.classes.remove(_orientation);

      switch(ori){

        case HORIZONTAL:
          _orientation = HORIZONTAL;
          break;
        default:
          _orientation = VERTICAL;
          break;
      }

      html.classes.add(_orientation);

    }

  }


  StackPanel._internal(String orientation, List<TBase> bases){

    _insertStyle(_stackPanelStyle);

    if(bases != null){

      children.addAll(bases);

      html.children.addAll(bases.map((o) => o.html));

    }

    this.orientation = orientation;

    html.classes.add(STACK_PANEL);

  }


  factory StackPanel.vertical([List<TBase> bases]){

    return new StackPanel._internal(VERTICAL, bases);

  }


  factory StackPanel.horizontal([List<TBase> bases]){

    return new StackPanel._internal(HORIZONTAL, bases);

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