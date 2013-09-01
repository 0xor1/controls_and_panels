/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String SIZER_PANEL = 'sizer-panel';
const String LEFT = 'left';
const String RIGHT = 'right';
const String TOP = 'top';
const String BOTTOM = 'bottom';
const String H_CENTER = 'h-center';
const String V_CENTER = 'v-center';
const String CENTER = 'center';
const String SIZER_LAYOUT_ASSISTANT = 'sizer-layout-assistant';


class SizerPanel extends Panel{

  DivElement _layoutAssistant = new DivElement()
    ..classes.add(SIZER_LAYOUT_ASSISTANT);

  SizerPanel(String widthStyle, String heightStyle){

    _insertSizerPanelStyleElement();

    html.style.width = widthStyle;

    html.style.height = heightStyle;

    horizontalAlignment = CENTER;

    verticalAlignment = CENTER;

    html.children.add(_layoutAssistant);

    html.classes.add(SIZER_PANEL);

  }


  String _horizontalAlignment;


  String get horizontalAlignment => _horizontalAlignment != H_CENTER ? _horizontalAlignment : CENTER;


  void set horizontalAlignment(String alignment){

    html.classes.remove(_horizontalAlignment);

    switch(alignment){
      case LEFT:
        _horizontalAlignment = LEFT;
        break;
      case RIGHT:
        _horizontalAlignment = RIGHT;
        break;
      default:
        _horizontalAlignment = H_CENTER;
    }

    html.classes.add(_horizontalAlignment);

  }


  String _verticalAlignment;


  String get verticalAlignment => _verticalAlignment != V_CENTER ? _verticalAlignment : CENTER;


  void set verticalAlignment(String alignment){

    html.classes.remove(_verticalAlignment);

    switch(alignment){
      case TOP:
        _verticalAlignment = TOP;
        break;
      case BOTTOM:
        _verticalAlignment = BOTTOM;
        break;
      default:
        _verticalAlignment = V_CENTER;
    }

    html.classes.add(_verticalAlignment);

  }


  void add(Base base){

    if(children.length == 0){

      children.add(base);

      _layoutAssistant.children.add(base.html);

    }

  }


  void insert(int index, Base base){

    if(index == 0){

      add(base);

    }

  }


  bool remove(Base base){

    _layoutAssistant.children.remove(base.html);

    children.remove(base);

  }


  Base removeAt(int index){

    if(index == 0 && children.length == 1){

      var base = children.removeAt(0);

      _layoutAssistant.children.remove(base.html);

      return base;

    }

    return null;

  }


}