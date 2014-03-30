/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;

class SizerPanel<TBase extends Base> extends Panel<TBase>{
  static const String CLASS = 'cnp-sizer-panel';
  static const String LEFT = 'left';
  static const String RIGHT = 'right';
  static const String TOP = 'top';
  static const String BOTTOM = 'bottom';
  static const String H_CENTER = 'h-center';
  static const String V_CENTER = 'v-center';
  static const String CENTER = 'center';
  static const String SIZER_INNER_LAYOUT_ASSISTANT = 'sizer-inner-layout-assistant';
  static const String SIZER_OUTER_LAYOUT_ASSISTANT = 'sizer-outer-layout-assistant';
  DivElement _outerLayoutAssistant = new DivElement()
  ..classes.add(SIZER_OUTER_LAYOUT_ASSISTANT);
  DivElement _innerLayoutAssistant = new DivElement()
    ..classes.add(SIZER_INNER_LAYOUT_ASSISTANT);
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

  SizerPanel(String widthStyle, String heightStyle){
    _sizerPanelStyle.insert();
    html.style.width = widthStyle;
    html.style.height = heightStyle;
    horizontalAlignment = CENTER;
    verticalAlignment = CENTER;
    html.children.add(
        _outerLayoutAssistant
          ..children.add(_innerLayoutAssistant));
    html.classes.add(CLASS);
  }

  void add(TBase item){
    if(items.length == 0){
      items.add(item);
      _innerLayoutAssistant.children.add(item.html);
    }
  }

  void insert(int index, TBase item){
    if(index == 0){
      add(item);
    }
  }

  bool remove(TBase item){
    _innerLayoutAssistant.children.remove(item.html);
    return items.remove(item);
  }

  TBase removeAt(int index){
    if(index == 0 && items.length == 1){
      var base = items.removeAt(0);
      _innerLayoutAssistant.children.remove(base.html);
      return base;
    }
    return null;
  }

  static final Style _sizerPanelStyle = new Style('''

    .$CLASS
      > .$SIZER_OUTER_LAYOUT_ASSISTANT
    {
      display: table;
      width: 100%;
      height: 100%;
      margin: 0;
      border: 0;
      padding: 0;
    }

    .$CLASS
      > .$SIZER_OUTER_LAYOUT_ASSISTANT
        > .$SIZER_INNER_LAYOUT_ASSISTANT
    {
      display: table-cell;
    }

    .$CLASS.$LEFT
      > .$SIZER_OUTER_LAYOUT_ASSISTANT
        > .$SIZER_INNER_LAYOUT_ASSISTANT
    {
      text-align: left;
    }

    .$CLASS.$RIGHT
      > .$SIZER_OUTER_LAYOUT_ASSISTANT
        > .$SIZER_INNER_LAYOUT_ASSISTANT
    {
      text-align: right;
    }

    .$CLASS.$H_CENTER
      > .$SIZER_OUTER_LAYOUT_ASSISTANT
        > .$SIZER_INNER_LAYOUT_ASSISTANT
    {
      text-align: center;
    }

    .$CLASS.$H_CENTER
      > .$SIZER_OUTER_LAYOUT_ASSISTANT
        > .$SIZER_INNER_LAYOUT_ASSISTANT
          > *
    {
      text-align: left; /*undo the style above*/
    }

    .$CLASS.$TOP
      > .$SIZER_OUTER_LAYOUT_ASSISTANT
        > .$SIZER_INNER_LAYOUT_ASSISTANT
    {
      vertical-align: top;
    }

    .$CLASS.$BOTTOM
      > .$SIZER_OUTER_LAYOUT_ASSISTANT
        > .$SIZER_INNER_LAYOUT_ASSISTANT
    {
      vertical-align: bottom;
    }

    .$CLASS.$V_CENTER
      > .$SIZER_OUTER_LAYOUT_ASSISTANT
        > .$SIZER_INNER_LAYOUT_ASSISTANT
    {
      vertical-align: middle;
    }

  ''');
}



