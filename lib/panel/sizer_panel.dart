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
const String SIZER_INNER_LAYOUT_ASSISTANT = 'sizer-inner-layout-assistant';
const String SIZER_OUTER_LAYOUT_ASSISTANT = 'sizer-outer-layout-assistant';


class SizerPanel extends Panel{

  DivElement _outerLayoutAssistant = new DivElement()
  ..classes.add(SIZER_OUTER_LAYOUT_ASSISTANT);

  DivElement _innerLayoutAssistant = new DivElement()
    ..classes.add(SIZER_INNER_LAYOUT_ASSISTANT);

  SizerPanel(String widthStyle, String heightStyle){

    _insertStyle(_sizerPanelStyle);

    html.style.width = widthStyle;

    html.style.height = heightStyle;

    horizontalAlignment = CENTER;

    verticalAlignment = CENTER;

    html.children.add(
        _outerLayoutAssistant
          ..children.add(_innerLayoutAssistant));

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

      _innerLayoutAssistant.children.add(base.html);

    }

  }


  void insert(int index, Base base){

    if(index == 0){

      add(base);

    }

  }


  bool remove(Base base){

    _innerLayoutAssistant.children.remove(base.html);

    children.remove(base);

  }


  Base removeAt(int index){

    if(index == 0 && children.length == 1){

      var base = children.removeAt(0);

      _innerLayoutAssistant.children.remove(base.html);

      return base;

    }

    return null;

  }


}



final Style _sizerPanelStyle = new Style('''

  .$BASE.$PANEL.$SIZER_PANEL
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
  {
    display: table;
    width: 100%;
    height: 100%;
    margin: 0;
    border: 0;
    padding: 0;
  }

  .$BASE.$PANEL.$SIZER_PANEL
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    display: table-cell;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$LEFT
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    text-align: left;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$RIGHT
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    text-align: right;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$H_CENTER
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    text-align: center;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$TOP
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    vertical-align: top;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$BOTTOM
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    vertical-align: bottom;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$V_CENTER
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    vertical-align: middle;
  }

''');